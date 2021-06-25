//
//  PendapatanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class PendapatanViewController: ViewController {
    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var topFormLabel: UILabel!
    @IBOutlet weak var bottomFormLabel: UILabel!
    @IBOutlet weak var pendapatanTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @IBAction func didTapSelanjutnyaBtn(_ sender: Any) {
        let nextStoryboard = UIStoryboard(name: "Kebutuhan", bundle: nil)
        let nextViewController = nextStoryboard.instantiateViewController(identifier: "KebutuhanViewController")
        
        show(nextViewController, sender: self)
    }
    
}
