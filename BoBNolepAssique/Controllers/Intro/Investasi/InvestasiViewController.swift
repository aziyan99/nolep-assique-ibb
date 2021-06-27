//
//  InvestasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class InvestasiViewController: ViewController {

    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var budgetContainer: UIView!
    @IBOutlet weak var sisaBudgetLabel: UILabel!
    @IBOutlet weak var sisaBudgetValue: UILabel!
    @IBOutlet weak var totalPengeluaranLabel: UILabel!
    @IBOutlet weak var totalPengeluaranValue: UILabel!
    @IBOutlet weak var tableViewInvestasi: UITableView!
    
    var dataSisa = [Sisa]()
    var totalPengeluaran: String!
    var dataInvestasi = [Investasi]()
    var dataKebutuhan = [Kebutuhan]()
    
    var editNama: String!
    var editJumlah: String!
    var editHarga: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInvestasi.dataSource = self
        tableViewInvestasi.delegate = self
        
        self.dataKebutuhan = KebutuhanHelper.getKebutuhan()
        self.dataInvestasi = InvestasiHelper.getInvestasi()
        
        countTotalPengeluaran()
        prepareView()
        prepareData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "investasiUpdated"), object: nil)
    }
    
    func prepareView() {
        title = "Investasi"
        self.sisaBudgetLabel.text = "Sisa Budget"
        self.totalPengeluaranLabel.text = "Pengeluaran"

        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        self.budgetContainer.layer.cornerRadius = 15
        
        self.tableViewInvestasi.backgroundColor = .systemGray6
    }
    
    func prepareData() {
        
        self.calculateSisa()
        
        self.dataSisa = SisaHelper.getSisa()
        let sisa = idrFormatter(val: self.dataSisa[0].total ?? "0.0")
        sisaBudgetValue.text = "\(sisa)"
        totalPengeluaranValue.text = idrFormatter(val: totalPengeluaran)
    }
    
    func countTotalPengeluaran() {
        var totalInvestasi: Double = 0.0
        for data in self.dataInvestasi{
            let harga = (data.harga! as NSString).doubleValue
            totalInvestasi += harga
        }
        self.totalPengeluaran = (totalInvestasi as NSNumber).stringValue
    }
    
    func calculateSisa() {
        var dataKebutuhan = [Kebutuhan]()
        var dataInvestasi = [Investasi]()
        dataKebutuhan = KebutuhanHelper.getKebutuhan()
        dataInvestasi = InvestasiHelper.getInvestasi()
        
        var dataPendapatan = [Pendapatan]()
        dataPendapatan = PendapatanHelper.getPendapatan()
        
        var sisa: String!
        
        var totalKebutuhan: Double = 0.0
        var totalInvestasi: Double = 0.0
        for data in dataKebutuhan{
            let harga = (data.harga! as NSString).doubleValue
            totalKebutuhan += harga
        }
        for data in dataInvestasi{
            let harga = (data.harga! as NSString).doubleValue
            totalInvestasi += harga
        }
        
        let doublePendapatan = (dataPendapatan[0].total! as NSString).doubleValue
        let res = doublePendapatan - totalKebutuhan - totalInvestasi
        
        sisa = (res as NSNumber).stringValue
        
        SisaHelper.emptySisa()
        let updateSisa = SisaHelper.createSisa()
        updateSisa.total = sisa
        SisaHelper.storeSisa()
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "DanaImpulsif", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "DanaImpulsifViewController")
        
        show(nextViewController, sender: self)
    }
    
    @objc func refresh() {
        viewDidLoad()
        
        self.tableViewInvestasi.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editInvestasi" {
            let indexPath: NSIndexPath = self.tableViewInvestasi.indexPathForSelectedRow! as NSIndexPath
            let nav = segue.destination as! UINavigationController
            let editInvestasiViewController = nav.topViewController as! EditInvestasiViewController
            editInvestasiViewController.nama = dataInvestasi[indexPath.row].nama
            editInvestasiViewController.jumlah = dataInvestasi[indexPath.row].jumlah
            editInvestasiViewController.harga = dataInvestasi[indexPath.row].harga
            editInvestasiViewController.investasi = dataInvestasi[indexPath.row]
        }
    }
    
}


extension InvestasiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataInvestasi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewInvestasi.dequeueReusableCell(withIdentifier: "investasiCell", for: indexPath)
        
        cell.textLabel?.text = "\(self.dataInvestasi[indexPath.row].nama!)"
        cell.detailTextLabel?.text = "\(idrFormatter(val: self.dataInvestasi[indexPath.row].harga!))"
        
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
