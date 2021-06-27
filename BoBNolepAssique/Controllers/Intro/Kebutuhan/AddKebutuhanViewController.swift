//
//  AddKebutuhanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 22/06/21.
//

import UIKit

enum KebutuhanData: Int {
    case nameTextField = 0
    case jumlahTextField
    case hargaTextField
}

class AddKebutuhanViewController: ViewController {
    
    var nama: String!
    var jumlah: String!
    var harga: String!
    
    var models = [SectionDetailIntro]()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(AddKebutuhanTableViewCell.self, forCellReuseIdentifier: AddKebutuhanTableViewCell.identifier)
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
        models.append(SectionDetailIntro(title: "DETAIL KEBUTUHAN", options: [
            .switchCell(model: TableInputDetailsIntro(title: "Nama", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("Nama")
            }),
            .switchCell(model: TableInputDetailsIntro(title: "Jumlah", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("Jumlah")
            }),
            .switchCell(model: TableInputDetailsIntro(title: "Harga", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("Harga")
            })
        ], footer: "Masukkan detail data kebutuhan kamu dari nama kebutuhan, berapa banyak jumlahnya, dan total harganya."))
    }
    
    func setupNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Tutup", style: .done, target: self, action: #selector(didTapTutupBtn))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Selesai", style: .done, target: self, action: #selector(didTapSelesaiBtn))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tambah Kebutuhan"
        setupNavbar()
        setupTable()
    }
    
    @objc func didTapTutupBtn() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSelesaiBtn() {
        if !nama.isEmpty, !harga.isEmpty, !jumlah.isEmpty {
            let newKebutuhan = KebutuhanHelper.createKebutuhan()
            newKebutuhan.nama = self.nama
            newKebutuhan.jumlah = self.jumlah
            newKebutuhan.harga = cleanCharacter(val: self.harga)
            newKebutuhan.updated_at = Date()
            KebutuhanHelper.storeKebutuhan()
            
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kebutuhanUpdated"), object: nil)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension AddKebutuhanViewController: UITableViewDelegate, UITableViewDataSource {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddKebutuhanTableViewCell.identifier, for: indexPath) as? AddKebutuhanTableViewCell else {
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

extension AddKebutuhanViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged(_ textField: UITextField){
        switch textField.tag {
        case KebutuhanData.nameTextField.rawValue:
            self.nama = textField.text
        case KebutuhanData.jumlahTextField.rawValue:
            self.jumlah = textField.text
        case KebutuhanData.hargaTextField.rawValue:
            self.harga = textField.text
        default:
            break
        }
    }
}
