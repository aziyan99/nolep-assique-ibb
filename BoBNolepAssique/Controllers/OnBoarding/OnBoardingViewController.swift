//
//  OnBoardingViewController.swift
//  BoBNolepAssique
//
//  Created by Muhammad Firdaus on 17/06/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    var window: UIWindow?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SelanjutnyaButton(_ sender: Any) {
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
