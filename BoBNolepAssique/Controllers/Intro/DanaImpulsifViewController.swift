//
//  DanaImpulsifViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class DanaImpulsifViewController: ViewController {

    @IBOutlet weak var btnSelanjutnya: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dana Impulsif"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "PerkiraanBiaya", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "PerkiraanBiayaViewController")
        
        show(nextViewController, sender: self)
    }
    
}
