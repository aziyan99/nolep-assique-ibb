//
//  PengaturanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class PengaturanViewController: ViewController {
    var models = [SectionSettings]()
    var window: UIWindow?

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(PengaturanTableViewCell.self, forCellReuseIdentifier: PengaturanTableViewCell.identifier)
        table.register(PengaturanSwitchTableViewCell.self, forCellReuseIdentifier: PengaturanSwitchTableViewCell.identifier)
        return table
    }()
    
    func setupModel() {
        models.append(SectionSettings(title: "Pendapatan Bulanan", options: [
            .staticCell(model: SettingsOption(title: "1.000.000,00", icon: UIImage(systemName: "triangle"), iconBackgrounColor: UIColor(named: "ButtonBrand")!) {
                print("PENDAPATANMU")
            })
        ], footer: "Kamu dapat melakukan perubahan total pendapatan dan mengubah estimasi pengeluaranmu dalam sebulan."))
        
        models.append(SectionSettings(title: "Notifikasi Keinginan", options: [
            .switchCell(model: SettingsSwitchOption(title: "Notifikasi", icon: UIImage(systemName: "dot.square"), iconBackgrounColor: UIColor(named: "ButtonBrand")!, isOn: true)
                {
                print("CHANGE NOTIF")
            })
        ], footer: "Notifikasi akan muncul ketika barang pada daftar keinginan telah mencapai masa kadaluarsa."))
    }
    
    func setupTableView() {
        setupModel()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func setupNavbar() {
        self.navigationItem.title = "Pengaturan"
        let GradientColor1 = UIColor(named: "GradientColor1")
        _ = UIColor(named: "GradientColor2")
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = GradientColor1
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupTableView()
    }
}

struct SectionSettings {
    let title: String
    let options: [SettingsOptionType]
    let footer: String
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}
struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgrounColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgrounColor: UIColor
    let handler: (() -> Void)
}

extension PengaturanViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PengaturanTableViewCell.identifier, for: indexPath) as? PengaturanTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PengaturanSwitchTableViewCell.identifier, for: indexPath) as? PengaturanSwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
            guard let onBoardingViewController = storyboard.instantiateViewController(identifier: "OnBoardingViewController") as? OnBoardingViewController else{
                print("ViewController not found")
                return
            }
            window?.rootViewController = onBoardingViewController
        }
    }
}
