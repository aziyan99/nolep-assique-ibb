//
//  InvestasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class InvestasiViewController: ViewController,
                               UITableViewDelegate,
                               UITableViewDataSource{

    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var budgetContainer: UIView!
    @IBOutlet weak var sisaBudgetLabel: UILabel!
    @IBOutlet weak var sisaBudgetValue: UILabel!
    @IBOutlet weak var totalPengeluaranLabel: UILabel!
    @IBOutlet weak var totalPengeluaranValue: UILabel!
    @IBOutlet weak var tableViewInvestasi: UITableView!
    
    let dummyInvestasi = [
        ["Emas", "Rp 600.000,00"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Investasi"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        self.budgetContainer.layer.cornerRadius = 15
        
        self.sisaBudgetLabel.text = "Sisa Budget"
        self.sisaBudgetValue.text = "Rp 0,00"
        
        self.totalPengeluaranLabel.text = "Pengeluaran"
        self.totalPengeluaranValue.text = "Rp 600.000,00"
        
        self.tableViewInvestasi.delegate = self
        self.tableViewInvestasi.dataSource = self
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "DanaImpulsif", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "DanaImpulsifViewController")
        
        show(nextViewController, sender: self)
    }
    
    /**
     Table view
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyInvestasi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewInvestasi.dequeueReusableCell(withIdentifier: "investasiCell", for: indexPath)
        
        cell.textLabel?.text = "\(dummyInvestasi[indexPath.row][0])"
        cell.detailTextLabel?.text = "\(dummyInvestasi[indexPath.row][1])"
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "DETAIL PENGELUARAN INVESTASI"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Ini adalah daftar perencanaan investasi kamu, seperti tabungan, ataupun pembelian emas yang akan jadi uang masa depan kamu nantinya."
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewInvestasi.deselectRow(at: indexPath, animated: true)
    }
    
}
