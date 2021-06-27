//
//  DetailKeinginanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//


import UIKit
import CoreData

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

class DetailKeinginanViewController: UIViewController {
    let defaultTitle = "Keinginan"
    var models = [SectionDetail]()
    
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var dateDifference = DateComponents()
    var category: Category?
//    var itemSavedDelegate: ItemSavedDelegate?
    
    
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
        self.dismiss(animated: true, completion: nil)
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
