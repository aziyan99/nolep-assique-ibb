//
//  PendapatanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class PendapatanViewController: ViewController {
    @IBOutlet weak var btnSelanjutnya: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pendapatan"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "Kebutuhan", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "KebutuhanViewController")
        
        show(nextViewController, sender: self)
    }
    
}
