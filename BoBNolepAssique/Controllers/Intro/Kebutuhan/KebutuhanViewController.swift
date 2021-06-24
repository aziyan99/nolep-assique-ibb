//
//  KebutuhanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class KebutuhanViewController: ViewController,
                               UITableViewDelegate,
                               UITableViewDataSource{
    
    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var budgetContainer: UIView!
    @IBOutlet weak var sisaBudgetLabel: UILabel!
    @IBOutlet weak var sisaBudgetValue: UILabel!
    @IBOutlet weak var totalPengeluaranLabel: UILabel!
    @IBOutlet weak var totalPengeluaranValue: UILabel!
    @IBOutlet weak var tableViewKebutuhan: UITableView!
    
    let dummyKebutuhan = [
        ["Makanan", "Rp 300.000,00"],
        ["Kos", "Rp 400.000,00"],
        ["Air dan Listrik", "Rp 300.000,00"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kebutuhan"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        budgetContainer.layer.cornerRadius = 15
        
        sisaBudgetLabel.text = "Sisa Budget"
        sisaBudgetValue.text = "Rp 500.000,00"
        
        totalPengeluaranLabel.text = "Pengeluaran"
        totalPengeluaranValue.text = "Rp 1.000.000,00"
        
        tableViewKebutuhan.dataSource = self
        tableViewKebutuhan.delegate = self
        
    }
    
    @IBAction func didTapSelanutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "Investasi", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "InvestasiViewController")
        
        show(nextViewController, sender: self)
    }
    
    /**
     Table view
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyKebutuhan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewKebutuhan.dequeueReusableCell(withIdentifier: "kebutuhanCell", for: indexPath)
        cell.textLabel?.text = "\(dummyKebutuhan[indexPath.row][0])"
        cell.detailTextLabel?.text = "\(dummyKebutuhan[indexPath.row][1])"
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "DETAIL PENGELUARAN KEBUTUHAN"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Ini adalah daftar perencanaan pengeluaran kebutuhan kamu untuk bulan ini, contohnya : makan, cicilan, tagihan, dan juga segala sesuatu yang menurutmu wajib dibayarkan ataupun dibeli."
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewKebutuhan.deselectRow(at: indexPath, animated: true)
    }
    
}
