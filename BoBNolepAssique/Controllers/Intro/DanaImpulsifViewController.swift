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
    @IBOutlet weak var bagIconLabel: UILabel!
    
    var dataSisa = [Sisa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareData()
        self.prepareView()
    }
    
    func prepareView() {
        title = "Dana Impulsif"
        self.sisaBudgetLabel.text = "Sisa Budget"
        self.totalPengeluaranLabel.text = "Pengeluaran"

        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        self.btnSelanjutnya.layer.cornerRadius = 8
        
        self.budgetContainer.layer.cornerRadius = 15
        
        self.bottomDetailText.text = "Dana impulsif kamu masih kosong nih. Jika kamu ingin menambahkan detail perencanaan impulsive, kamu bisa menambahkannya di menu keinginan."
        self.bottomDetailText.numberOfLines = 0
        
        let bagIcon = NSTextAttachment()
        bagIcon.image = UIImage(systemName: "bag", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60.0))
        
        bagIconLabel.attributedText = NSAttributedString(attachment: bagIcon)
    }
    
    func prepareData() {
        self.dataSisa = SisaHelper.getSisa()
        let sisa = idrFormatter(val: self.dataSisa[0].total ?? "0.0")
        sisaBudgetValue.text = "\(sisa)"
        totalPengeluaranValue.text = idrFormatter(val: "0")
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "PerkiraanBiaya", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "PerkiraanBiayaViewController")
        
        show(nextViewController, sender: self)
    }
    
}
