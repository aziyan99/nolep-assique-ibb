//
//  DetailKeinginanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//


import UIKit
import CoreData


//extension Date {
//    init(_ dateString:String) {
//        let dateStringFormatter = DateFormatter()
//        dateStringFormatter.dateFormat = "dd-MM-yyyy"
//        dateStringFormatter.timeZone = NSTimeZone(name:"UTC") as TimeZone?
//        let date = dateStringFormatter.date(from: dateString)!
//        self.init(timeInterval:0, since:date)
//    }
//}
//
//extension Array where Element: Keinginan {
//    func groupedBy(dateComponents: Set<Calendar.Component>) -> [String: [Element]] {
//        let initial: [String: [Element]] = [:]
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy MM dd"
//        let groupedByDateComponents = reduce(into: initial) { acc, cur in
//            let components = Calendar.current.dateComponents(dateComponents, from: cur.updated_at!)
//            let date = dateFormatter.string(from: Calendar.current.date(from: components)!)
//            let existing = acc[date] ?? []
//            acc[date] = existing + [cur]
//        }
//        return groupedByDateComponents
//    }
//}
//
//extension String {
//    func symbolToImage() -> UIImage {
//        let size = CGSize(width: 35, height: 38)
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        UIColor.clear.set()
//        let rect = CGRect(origin: .zero, size: size)
//        UIRectFill(CGRect(origin: .zero, size: size))
//        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 30)])
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image ?? UIImage()
//    }
//}

struct SectionDetail {
    let title: String
    let options: [TableInputType]
    let footer: String
}

enum TableInputType {
    case switchCell(model: TableInputDetails)
    case switchStatus(model: TableInputStatus)
    case switchNote(model: TableInputNote)
    case switchUpload(model: TableUploadImage)
}
struct TableInputDetails {
    let title: String
    let icon: UIImage?
    let iconBackgrounColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}
struct TableInputStatus {
    let title: String
    let isOn: Bool
}
struct TableInputNote {
    let title: String
    let description: String
}
struct TableUploadImage {
    let title: String
}

protocol ItemSavedDelegate: class {
    func itemSaved()
}

class DetailKeinginanViewController: UIViewController {
    let defaultTitle = "Keinginan"
    var models = [SectionDetail]()
    
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var keinginanList = [String: [Keinginan]]()
    var keinginan = [Keinginan]()
    
    var dateDifference = DateComponents()
    var category: Category?
    var itemSavedDelegate: ItemSavedDelegate?
    
    var productName : String = ""
    
    func onSave() {
        print ("SKUYY SAVE")
        let keinginanRequest: NSFetchRequest<Keinginan> = Keinginan.fetchRequest()
        print(keinginanRequest ,"REQ KEINGINAN")
        do {
            do {
                try keinginan = managedObjectContext.fetch(keinginanRequest)
                print(keinginan, "KEINGINAN")
                let entity = NSEntityDescription.entity(forEntityName: "Keinginan", in: managedObjectContext)
                let newKeinginan = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
                var incrementId = 0
                if keinginan.count == 0 {
                    incrementId = 1
                } else {
                    incrementId = Int(keinginan.last!.id + 1)
                }
                
                let cellName = tableView.cellForRow(at:IndexPath(row:0, section: 0)) as! DetailKeinginanTableViewCell
                let cellJumlah = tableView.cellForRow(at:IndexPath(row:1, section: 0)) as! DetailKeinginanTableViewCell
                let cellHarga = tableView.cellForRow(at:IndexPath(row:2, section: 0)) as! DetailKeinginanTableViewCell
                let cellLokasi = tableView.cellForRow(at:IndexPath(row:3, section: 0)) as! DetailKeinginanTableViewCell
                
                
                let cellCatatan = tableView.cellForRow(at:IndexPath(row:0, section: 2)) as! DetailKeinginanNoteTableViewCell
                
                
                let cellSwitch = tableView.cellForRow(at:IndexPath(row:0, section: 1)) as! DetailKeinginanSwitchTableViewCell
                
                newKeinginan.setValue(incrementId, forKey: "id")
                newKeinginan.setValue(cellName.textInputField.text!, forKey: "nama")
                newKeinginan.setValue(Int64(cellJumlah.textInputField.text!), forKey: "jumlah")
                newKeinginan.setValue(cellHarga.textInputField.text!, forKey: "harga")
                newKeinginan.setValue(cellLokasi.textInputField.text!, forKey: "lokasi")

                newKeinginan.setValue(cellSwitch.switcher.isOn, forKey: "is_active")
//
                newKeinginan.setValue(cellCatatan.textInputField.text!, forKey: "catatan")
                newKeinginan.setValue(NSDate.now, forKey: "updated_at")
                newKeinginan.setValue("Belum dibeli", forKey: "status")
                
                try managedObjectContext.save()
//                setNotif()
                print("Save Success")
                itemSavedDelegate?.itemSaved()
                dismiss(animated: true, completion: nil)
            } catch let error as NSError {
                print("Failed to generate new ID \(error)")
            }
        } catch let e as NSError {
            print("Save Error \(e)")
        }
    }
    
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(DetailKeinginanTableViewCell.self, forCellReuseIdentifier: DetailKeinginanTableViewCell.identifier)
        table.register(DetailKeinginanSwitchTableViewCell.self, forCellReuseIdentifier: DetailKeinginanSwitchTableViewCell.identifier)
        table.register(DetailKeinginanNoteTableViewCell.self, forCellReuseIdentifier: DetailKeinginanNoteTableViewCell.identifier)
        table.register(DetailKeinginanUploadTableViewCell.self, forCellReuseIdentifier: DetailKeinginanUploadTableViewCell.identifier)
        return table
    }()
    
    func setupTable() {
        setupModel()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func setupModel() {
        models.append(SectionDetail(title: "Detail Keinginan", options: [
            .switchCell(model: TableInputDetails(title: "Nama", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("CHANGE NOTIF")
            }),
            .switchCell(model: TableInputDetails(title: "Jumlah", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("CHANGE NOTIF")
            }),
            .switchCell(model: TableInputDetails(title: "Harga", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("CHANGE NOTIF")
            }),
            .switchCell(model: TableInputDetails(title: "Lokasi", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("CHANGE NOTIF")
            })
        ], footer: "Detail keinginan berupa nama, berapa banyak jumlahnya, total harga, dan juga lokasi tempat pembelian seperti website, aplikasi , ataupun alamat toko."))
        
        models.append(SectionDetail(title: "Status Barang", options: [.switchStatus(model: TableInputStatus(title: "Belum Dibeli", isOn: false))], footer: "Jika barang belum dibeli. detail tenggat waktu dapat ditentukan."))
        
        models.append(SectionDetail(title: "Catatan (Opsional)", options: [.switchNote(model: TableInputNote(title: "", description: ""))], footer: "Catatan berupa alasan kenapa ingin membeli, atau spesifikasi lengkap keinginan."))
        
        models.append(SectionDetail(title: "Foto (Opsional)", options: [.switchUpload(model: TableUploadImage(title: "Unggah Foto"))], footer: "Foto berupa barang yang ingin dibeli, atau tempat yang ingin dikunjungi, sesuai dengan keinginanmu."))
    }
    
    @objc func buttonCloseModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonSaveModal() {
        print("BUTTON SAVE MODAL")
        onSave()
//        self.dismiss(animated: true, completion: nil)
    }
    
    func setupNavbar() {
        title = defaultTitle
        buttonCancel.setTitle("Tutup", for: .normal)
        buttonCancel.addTarget(self, action: #selector(buttonCloseModal), for: .touchDown)
        buttonDone.setTitle("Selesai", for: .normal)
        buttonDone.addTarget(self, action: #selector(buttonSaveModal), for: .touchDown)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupTable()
        managedObjectContext = appDelegate?.persistentContainer.viewContext as! NSManagedObjectContext
//        getDataKeinginan(isFilter: false, filterValue: "")
//        print(keinginanList, "KEINGINAN LIST")
    }
}

extension DetailKeinginanViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let section = models[section]
        return section.footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailKeinginanTableViewCell.identifier, for: indexPath) as? DetailKeinginanTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchStatus(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailKeinginanSwitchTableViewCell.identifier, for: indexPath) as? DetailKeinginanSwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchNote(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailKeinginanNoteTableViewCell.identifier, for: indexPath) as? DetailKeinginanNoteTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchUpload(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailKeinginanUploadTableViewCell.identifier, for: indexPath) as? DetailKeinginanUploadTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    
}
