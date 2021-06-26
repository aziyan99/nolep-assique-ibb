//
//  PerkiraanBiayaViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class PerkiraanBiayaViewController: ViewController {
    
    final var window: UIWindow?
    @IBOutlet weak var btnSelesai: UIButton!
    @IBOutlet weak var btnUlangi: UIButton!
    @IBOutlet weak var topMessageContainer: UIView!
    @IBOutlet weak var topMessageValue: UILabel!
    @IBOutlet weak var perkiraanBiayaTableView: UITableView!
    
    
    let dummyData = [
        ["Kebutuhan", "Rp 1.000.000,00"],
        ["Investasi", "Rp 600.000,00"],
        ["Impulsif", "Rp 0,00"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perkiraan Biaya"
        self.btnSelesai.setTitle("Selesai", for: UIControl.State.normal)
        self.btnSelesai.layer.cornerRadius = 5
        
        self.btnUlangi.setTitle("Ulangi", for: UIControl.State.normal)
        self.btnUlangi.layer.cornerRadius = 5
        
        self.topMessageContainer.layer.cornerRadius = 15
        self.topMessageValue.numberOfLines = 0
        self.topMessageValue.text = "Berdasarkan teori Elizabeth Warren, pendapatan setelah pajak dibagi berdasarkan tiga kategori, yaitu: 50% untuk kebutuhan, 30% untuk keinginan, dan 20% untuk tabungan."
        
        self.perkiraanBiayaTableView.dataSource = self
        self.perkiraanBiayaTableView.delegate = self
        
        self.perkiraanBiayaTableView.backgroundColor = .systemGray6
        
    }

    @IBAction func didTapSelesaiBtn(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        isFirstTime.set(true, forKey: keyFirstTime)
    }
    
    @IBAction func didTapUlangiBtn(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Mengulangi semua perencanaan?", preferredStyle: .actionSheet)
        
        let btnUlangi = UIAlertAction(title: "Ya, ulangi", style: .default, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true)
        })
        
        let btnBatal = UIAlertAction(title: "Tidak, batalkan", style: .destructive, handler: nil)
        
        let btnCancel = UIAlertAction(title: "Batal", style: .cancel, handler: nil)
        
        optionMenu.addAction(btnUlangi)
        optionMenu.addAction(btnBatal)
        optionMenu.addAction(btnCancel)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
    
}

extension PerkiraanBiayaViewController: UITableViewDelegate,
                                        UITableViewDataSource{
    /**
     Table view
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = perkiraanBiayaTableView.dequeueReusableCell(withIdentifier: "perkiraanBiayaCell", for: indexPath)
        
        cell.textLabel?.text = "\(dummyData[indexPath.row][0])"
        cell.detailTextLabel?.text = "\(dummyData[indexPath.row][0])"
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perkiraanBiayaTableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            //kebutuhan
            let nextStoryboard = UIStoryboard(name: "Kebutuhan", bundle: nil)
            let nextViewController = nextStoryboard.instantiateViewController(identifier: "KebutuhanViewController")
            
            show(nextViewController, sender: self)
        }
        else if indexPath.row == 1 {
            //investasi
            let nextStoryboard = UIStoryboard(name: "Investasi", bundle: nil)
            let nextViewController = nextStoryboard.instantiateViewController(identifier: "InvestasiViewController")
            
            show(nextViewController, sender: self)
        }else{
            //impulsif
            let nextStoryboard = UIStoryboard(name: "DanaImpulsif", bundle: nil)
            let nextViewController = nextStoryboard.instantiateViewController(identifier: "DanaImpulsifViewController")
            
            show(nextViewController, sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "DETAIL PERKIRAAN BIAYA"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Ini adalah total perkiraan biaya dari masing-masing akumulasi pembagian keuangan kamu, jangan takut untuk mengubahnya lagi jika menurutmu kurang tepat."
    }
}
