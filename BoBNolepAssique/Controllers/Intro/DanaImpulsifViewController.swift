//
//  DanaImpulsifViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class DanaImpulsifViewController: ViewController {

    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var budgetContainer: UIView!
    @IBOutlet weak var bottomDetailText: UILabel!
    @IBOutlet weak var sisaBudgetLabel: UILabel!
    @IBOutlet weak var sisaBudgetValue: UILabel!
    @IBOutlet weak var totalPengeluaranLabel: UILabel!
    @IBOutlet weak var totalPengeluaranValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dana Impulsif"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        budgetContainer.layer.cornerRadius = 15
        
        self.sisaBudgetLabel.text = "Sisa Budget"
        self.sisaBudgetValue.text = "Rp 900.000,00"
        
        self.totalPengeluaranLabel.text = "Pengeluaran"
        self.totalPengeluaranValue.text = "Rp 0,00"
        
        self.bottomDetailText.text = "Dana impulsif kamu masih kosong nih. Jika kamu ingin menambahkan detail perencanaan impulsive, kamu bisa menambahkannya di menu keinginan."
        self.bottomDetailText.numberOfLines = 0
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "PerkiraanBiaya", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "PerkiraanBiayaViewController")
        
        show(nextViewController, sender: self)
    }
    
}
