//
//  KebutuhanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class KebutuhanViewController: ViewController {
    @IBOutlet weak var btnSelanjutnya: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kebutuhan"
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
    }
    
    @IBAction func didTapSelanutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "Investasi", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "InvestasiViewController")
        
        show(nextViewController, sender: self)
    }
    
}
