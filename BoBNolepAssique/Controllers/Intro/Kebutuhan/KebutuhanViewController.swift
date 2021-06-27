//
//  KebutuhanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class KebutuhanViewController: ViewController {
    
    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var budgetContainer: UIView!
    @IBOutlet weak var sisaBudgetLabel: UILabel!
    @IBOutlet weak var sisaBudgetValue: UILabel!
    @IBOutlet weak var totalPengeluaranLabel: UILabel!
    @IBOutlet weak var totalPengeluaranValue: UILabel!
    @IBOutlet weak var tableViewKebutuhan: UITableView!
    
    var dataSisa = [Sisa]()
    var totalPengeluaran: String!
    var dataKebutuhan = [Kebutuhan]()
    
    var editNama: String!
    var editJumlah: String!
    var editHarga: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewKebutuhan.dataSource = self
        tableViewKebutuhan.delegate = self
        
        self.dataKebutuhan = KebutuhanHelper.getKebutuhan()
        
        countTotalPengeluaran()
        prepareView()
        prepareData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "kebutuhanUpdated"), object: nil)
        
    }
    
    func prepareView() {
        title = "Kebutuhan"
        self.sisaBudgetLabel.text = "Sisa Budget"
        self.totalPengeluaranLabel.text = "Pengeluaran"

        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        self.budgetContainer.layer.cornerRadius = 15
        
        self.tableViewKebutuhan.backgroundColor = .systemGray6
    }
    
    func prepareData() {
        
        self.calculateSisa()
        
        self.dataSisa = SisaHelper.getSisa()
        let sisa = idrFormatter(val: self.dataSisa[0].total ?? "0.0")
        sisaBudgetValue.text = "\(sisa)"
        totalPengeluaranValue.text = idrFormatter(val: totalPengeluaran)
    }
    
    func countTotalPengeluaran() {
        var totalKebutuhan: Double = 0.0
        for data in self.dataKebutuhan{
            let harga = (data.harga! as NSString).doubleValue
            totalKebutuhan += harga
        }
        self.totalPengeluaran = (totalKebutuhan as NSNumber).stringValue
    }
    
    func calculateSisa() {
        var dataKebutuhan = [Kebutuhan]()
        dataKebutuhan = KebutuhanHelper.getKebutuhan()
        
        var dataPendapatan = [Pendapatan]()
        dataPendapatan = PendapatanHelper.getPendapatan()
        
        var sisa: String!
        
        var totalKebutuhan: Double = 0.0
        for data in dataKebutuhan{
            let harga = (data.harga! as NSString).doubleValue
            totalKebutuhan += harga
        }
        
        let doublePendapatan = (dataPendapatan[0].total! as NSString).doubleValue
        let res = doublePendapatan - totalKebutuhan
        
        sisa = (res as NSNumber).stringValue
        
        SisaHelper.emptySisa()
        let updateSisa = SisaHelper.createSisa()
        updateSisa.total = sisa
        SisaHelper.storeSisa()
    }
    
    @IBAction func didTapSelanutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "Investasi", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "InvestasiViewController")
        
        show(nextViewController, sender: self)
    }
    
    @objc func refresh() {
        viewDidLoad()
        
        self.tableViewKebutuhan.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editKebutuhan" {
            let indexPath: NSIndexPath = self.tableViewKebutuhan.indexPathForSelectedRow! as NSIndexPath
            let nav = segue.destination as! UINavigationController
            let editKebutuhanViewController = nav.topViewController as! EditKebutuhanViewController
            editKebutuhanViewController.nama = dataKebutuhan[indexPath.row].nama
            editKebutuhanViewController.jumlah = dataKebutuhan[indexPath.row].jumlah
            editKebutuhanViewController.harga = dataKebutuhan[indexPath.row].harga
            editKebutuhanViewController.kebutuhan = dataKebutuhan[indexPath.row]
        }
    }
    
}

extension KebutuhanViewController: UITableViewDelegate, UITableViewDataSource {
    /**
     Table view
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataKebutuhan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewKebutuhan.dequeueReusableCell(withIdentifier: "kebutuhanCell", for: indexPath)
        cell.textLabel?.text = "\(dataKebutuhan[indexPath.row].nama!)"
        cell.detailTextLabel?.text = "\(idrFormatter(val: dataKebutuhan[indexPath.row].harga!))"
        
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
