//
//  PendapatanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit
import CoreData

class PendapatanViewController: ViewController {
    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var topFormLabel: UILabel!
    @IBOutlet weak var bottomFormLabel: UILabel!
    @IBOutlet weak var pendapatanTextField: UITextField!
    
    var dataPendapatan = [Pendapatan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPendapatanValue()
    }
    
    func setupPendapatanValue() {
        self.dataPendapatan = PendapatanHelper.getPendapatan()
        if self.dataPendapatan.count > 0 {
            let pendapatan = self.dataPendapatan[0].total ?? "0.0"
            let pendapatanFormatter = idrFormatter(val: pendapatan)
            self.pendapatanTextField.text = pendapatanFormatter
        }else{
            // pendapatan belum diset
        }
    }
    
    func setupView() {
        title = "Pendapatan"
        
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        self.topFormLabel.text = "PENDAPATAN BULANAN"
        self.bottomFormLabel.text = "Masukkan total pendapatan kamu dalam sebulan"
        
        pendapatanTextField.clearButtonMode = .always
        pendapatanTextField.clearButtonMode = .whileEditing
        
        let GradientColor1 = UIColor(named: "GradientColor1")
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = GradientColor1
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        if !pendapatanTextField.text!.isEmpty {
            PendapatanHelper.emptyPendapatan()
            let pendapatan = PendapatanHelper.createPendapatan()
            pendapatan.total = cleanCharacter(val: pendapatanTextField.text!)
            pendapatan.updated_at = Date()
            PendapatanHelper.storePendapatan()
            
            SisaHelper.emptySisa()
            let sisa = SisaHelper.createSisa()
            sisa.total = cleanCharacter(val: pendapatanTextField.text!)
            SisaHelper.storeSisa()
            
            let nextStoryboard = UIStoryboard(name: "Kebutuhan", bundle: nil)
            let nextViewController = nextStoryboard.instantiateViewController(identifier: "KebutuhanViewController")
            
            show(nextViewController, sender: self)
        }else{
            // form kosong
        }
    }
}
