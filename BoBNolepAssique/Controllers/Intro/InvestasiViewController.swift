//
//  InvestasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class InvestasiViewController: ViewController {

    @IBOutlet weak var btnSelanjutnya: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Investasi"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "DanaImpulsif", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "DanaImpulsifViewController")
        
        show(nextViewController, sender: self)
    }
    

}
