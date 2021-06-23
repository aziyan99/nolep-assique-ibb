//
//  AddInvestasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 23/06/21.
//

import UIKit

class AddInvestasiViewController: ViewController {

    @IBOutlet weak var topFormLabel: UILabel!
    @IBOutlet weak var bottomFormLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topFormLabel.text = "DETAIL INVESTASI"
        self.bottomFormLabel.text = "Masukkan detail data dari investasi kamu mulai dari nama investasi, kemudian berapa jumlahnya, beserta total harga investasi kamu."
        
        self.bottomFormLabel.numberOfLines = 0
    }

    @IBAction func didTapTutupBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
