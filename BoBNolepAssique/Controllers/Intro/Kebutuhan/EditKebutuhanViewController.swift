//
//  EditKebutuhanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 25/06/21.
//

import UIKit

class EditKebutuhanViewController: ViewController {

    var models = [SectionDetail]()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(EditKebutuhanTabelViewCell.self, forCellReuseIdentifier: EditKebutuhanTabelViewCell.identifier)
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
        models.append(SectionDetail(title: "DETAIL KEBUTUHAN", options: [
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
        ], footer: "Masukkan detail data kebutuhan kamu dari nama kebutuhan, berapa banyak jumlahnya, dan total harganya."))
    }
    
    func setupNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Tutup", style: .done, target: self, action: #selector(didTapTutupBtn))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ubah Kebutuhan"
        setupNavbar()
        setupTable()
    }
    
    @objc func didTapTutupBtn(){
        self.dismiss(animated: true, completion: nil)
    }

}


extension EditKebutuhanViewController: UITableViewDelegate, UITableViewDataSource {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EditKebutuhanTabelViewCell.identifier, for: indexPath) as? EditKebutuhanTabelViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
}
