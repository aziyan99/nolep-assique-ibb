//
//  AddKebutuhanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 22/06/21.
//

import UIKit

class AddKebutuhanViewController: ViewController {

    @IBOutlet weak var topFormLabel: UILabel!
    @IBOutlet weak var bottomFormLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topFormLabel.text = "DETAIL KEBUTUHAN"
        bottomFormLabel.text = "Masukkan detail data kebutuhan kamu dari nama kebutuhan, berapa banyak jumlahnya, dan total harganya."
    }

    @IBAction func didTapTutupBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
