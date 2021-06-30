//
//  EditInvestasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 25/06/21.
//

import UIKit

class EditInvestasiViewController: ViewController {

    var models = [SectionDetailIntro]()
    
    var nama: String!
    var jumlah: String!
    var harga: String!
    
    var editInvestasi = [String]()
    var investasi: Investasi?
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(EditInvestasiTableViewCell.self, forCellReuseIdentifier: EditInvestasiTableViewCell.identifier)
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
        models.append(SectionDetailIntro(title: "DETAIL INVESTASI", options: [
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
        ], footer: "Masukkan detail data dari investasi kamu mulai dari nama investasi, kemudian berapa jumlahnya, beserta total harga investasi kamu."))
    }
    
    func setupNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Tutup", style: .done, target: self, action: #selector(didTapTutupBtn))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(didTapSelesaiBtn))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ubah Investasi"
        setupNavbar()
        setupTable()
        
        self.editInvestasi.append(self.nama)
        self.editInvestasi.append(self.jumlah)
        self.editInvestasi.append(self.harga)
    }
    
    @objc func didTapTutupBtn(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSelesaiBtn(){
        if !nama.isEmpty, !harga.isEmpty, !jumlah.isEmpty {
            investasi?.nama = self.nama
            investasi?.jumlah = self.jumlah
            investasi?.harga = cleanCharacter(val: self.harga)
            investasi?.updated_at = Date()
            InvestasiHelper.storeInvestasi()
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "investasiUpdated"), object: nil)
            
            self.dismiss(animated: true, completion: nil)
        }else{
            print("emptyyy")
        }
    }
}


extension EditInvestasiViewController: UITableViewDelegate, UITableViewDataSource {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EditInvestasiTableViewCell.identifier, for: indexPath) as? EditInvestasiTableViewCell else {
                return UITableViewCell()
            }
            if indexPath.row > 1 {
                cell.textInputField.text! = idrFormatter(val: self.editInvestasi[indexPath.row])
            }else {
                cell.textInputField.text! = self.editInvestasi[indexPath.row]
            }
            cell.textInputField.delegate = self
            cell.textInputField.tag = indexPath.row
            cell.configure(with: model)
            return cell
        }
    }
}

extension EditInvestasiViewController: UITextFieldDelegate {
    
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
