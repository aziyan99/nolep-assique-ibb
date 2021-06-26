//
//  SecondOnBoardingViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 25/06/21.
//

import UIKit

class SecondOnBoardingViewController: ViewController {

    @IBOutlet weak var btnMulai: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnMulai.setTitle("Mulai", for: UIControl.State.normal)
        self.btnMulai.layer.cornerRadius = 8
    }
    
    @IBAction func didTapMulaiBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Pendapatan", bundle: nil)
        guard let pendapatanViewController = storyboard.instantiateViewController(identifier: "PendapatanViewController") as? PendapatanViewController else{
            print("ViewController not found")
            return
        }
        let rootNavigationController = UINavigationController(rootViewController: pendapatanViewController)
        rootNavigationController.navigationBar.prefersLargeTitles = true

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootNavigationController)
    }
}
