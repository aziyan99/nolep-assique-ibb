//
//  OnBoardingViewController.swift
//  BoBNolepAssique
//
//  Created by Muhammad Firdaus on 17/06/21.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var btnSelanjutnya: UIButton!
    @IBOutlet weak var topLogoImg: UIImageView!
    @IBOutlet weak var bigMidlleImg: UIImageView!
    @IBOutlet weak var headerBottomMiddleImg: UILabel!
    
    
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSelanjutnya.layer.cornerRadius = 8
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
    }
    
    @IBAction func SelanjutnyaButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondOnboarding", bundle: nil)
        guard let pendapatanViewController = storyboard.instantiateViewController(identifier: "SecondOnBoardingViewController") as? SecondOnBoardingViewController else{
            print("ViewController not found")
            return
        }
        let rootNavigationController = UINavigationController(rootViewController: pendapatanViewController)
        rootNavigationController.navigationBar.prefersLargeTitles = true

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootNavigationController)
    }
}
