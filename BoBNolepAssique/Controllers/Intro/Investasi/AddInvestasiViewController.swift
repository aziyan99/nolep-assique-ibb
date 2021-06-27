//
//  AddInvestasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 23/06/21.
//
import UIKit

enum InvestasiData: Int {
    case nameTextField = 0
    case jumlahTextField
    case hargaTextField
}


class AddInvestasiViewController: ViewController {
    
    var nama: String!
    var jumlah: String!
    var harga: String!
    
    var models = [SectionDetail]()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(AddInvestasiTableViewCell.self, forCellReuseIdentifier: AddInvestasiTableViewCell.identifier)
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
        models.append(SectionDetail(title: "DETAIL INVESTASI", options: [
            .switchCell(model: TableInputDetails(title: "Nama", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("Nama")
            }),
            .switchCell(model: TableInputDetails(title: "Jumlah", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("Jumlah")
            }),
            .switchCell(model: TableInputDetails(title: "Harga", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("Harga")
            })
        ], footer: "Masukkan detail data dari investasi kamu mulai dari nama investasi, kemudian berapa jumlahnya, beserta total harga investasi kamu."))
    }
    
    func setupNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Tutup", style: .done, target: self, action: #selector(didTapTutupBtn))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(didTapSelesaiBtn))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tambah Investasi"
        setupNavbar()
        setupTable()
    }
    
    @objc func didTapTutupBtn(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSelesaiBtn() {
        if !nama.isEmpty, !harga.isEmpty, !jumlah.isEmpty {
            let newInvestasi = InvestasiHelper.createInvestasi()
            newInvestasi.nama = self.nama
            newInvestasi.jumlah = self.jumlah
            newInvestasi.harga = cleanCharacter(val: self.harga)
            newInvestasi.updated_at = Date()
            InvestasiHelper.storeInvestasi()
            
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "investasiUpdated"), object: nil)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}


extension AddInvestasiViewController: UITableViewDelegate, UITableViewDataSource {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddInvestasiTableViewCell.identifier, for: indexPath) as? AddInvestasiTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            cell.textInputField.delegate = self
            cell.textInputField.tag = indexPath.row

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension AddInvestasiViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged(_ textField: UITextField){
        switch textField.tag {
        case InvestasiData.nameTextField.rawValue:
            self.nama = textField.text
        case InvestasiData.jumlahTextField.rawValue:
            self.jumlah = textField.text
        case InvestasiData.hargaTextField.rawValue:
            self.harga = textField.text
        default:
            break
        }
    }
}
