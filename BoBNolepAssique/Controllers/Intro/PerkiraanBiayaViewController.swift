//
//  PerkiraanBiayaViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class PerkiraanBiayaViewController: ViewController,
                                    UITableViewDelegate,
                                    UITableViewDataSource{
    
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
        
    }

    @IBAction func didTapSelesaiBtn(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        isFirstTime.set(true, forKey: keyFirstTime)
    }
    
    @IBAction func didTapUlangiBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
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
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "DETAIL PERKIRAAN BIAYA"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Ini adalah total perkiraan biaya dari masing-masing akumulasi pembagian keuangan kamu, jangan takut untuk mengubahnya lagi jika menurutmu kurang tepat."
    }
    
}
