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
    @IBOutlet weak var firstIcon: UIImageView!
    @IBOutlet weak var firstMessage: UILabel!
    @IBOutlet weak var secondIcon: UIImageView!
    @IBOutlet weak var secondMessage: UILabel!
    @IBOutlet weak var thirdIcon: UIImageView!
    @IBOutlet weak var thirdMessage: UILabel!
    
    
    
    
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSelanjutnya.layer.cornerRadius = 8
        self.btnSelanjutnya.setTitle("Selanjutnya", for: UIControl.State.normal)
        
        self.topLogoImg.image = UIImage(named: "AppLogo")
        self.bigMidlleImg.image = UIImage(named: "onboarding-1")
        self.headerBottomMiddleImg.text = "Estimasi & Perencanaan"
        
        self.firstIcon.image = UIImage(systemName: "sum")
        self.firstIcon.tintColor = UIColor(named: "GradientColor1")
        self.firstMessage.text = "Membantumu melakukan perhitungan estimasi pengeluaran berdasarkan pendapatanmu dalam sebulan"
        self.firstMessage.textColor = UIColor.systemGray
        self.firstMessage.numberOfLines = 0
        
        self.secondIcon.image = UIImage(systemName: "bag")
        self.secondIcon.tintColor = UIColor(named: "GradientColor1")
        self.secondMessage.text = "Membantumu mempertimbangkan pembelian impulsif perbulan"
        self.secondMessage.textColor = UIColor.systemGray
        self.secondMessage.numberOfLines = 0
        
        self.thirdIcon.image = UIImage(systemName: "questionmark.circle")
        self.thirdIcon.tintColor = UIColor(named: "GradientColor1")
        self.thirdMessage.text = "Pembelian Impulsif adalah pembelian yang dilakukan secara spontan dan cenderung tidak dibutuhkan"
        self.thirdMessage.textColor = UIColor.systemGray
        self.thirdMessage.numberOfLines = 0
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
