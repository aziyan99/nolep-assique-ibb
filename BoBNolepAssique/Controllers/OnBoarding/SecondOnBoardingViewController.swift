//
//  SecondOnBoardingViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 25/06/21.
//

import UIKit

class SecondOnBoardingViewController: ViewController {

    @IBOutlet weak var btnMulai: UIButton!
    @IBOutlet weak var topLogo: UIImageView!
    @IBOutlet weak var bigMidlleImg: UIImageView!
    @IBOutlet weak var headerBottom: UILabel!
    @IBOutlet weak var firstIcon: UIImageView!
    @IBOutlet weak var firstMessage: UILabel!
    @IBOutlet weak var secondIcon: UIImageView!
    @IBOutlet weak var secondMessage: UILabel!
    @IBOutlet weak var thirdIcon: UIImageView!
    @IBOutlet weak var thirdMessage: UILabel!
    @IBOutlet weak var fourthIcon: UIImageView!
    @IBOutlet weak var fourthMessage: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnMulai.setTitle("Mulai", for: UIControl.State.normal)
        self.btnMulai.layer.cornerRadius = 8
        
        self.headerBottom.text = "Yang Harus Dilakukan"
        
        self.topLogo.image = UIImage(named: "AppLogo")
        self.bigMidlleImg.image = UIImage(named: "onboarding-2")
        
        self.firstIcon.image = UIImage(systemName: "1.square")
        self.firstIcon.tintColor = UIColor(named: "GradientColor1")
        self.firstMessage.text = "Memasukkan total pendapatanmu dalam sebulan"
        self.firstMessage.textColor = UIColor.systemGray
        self.firstMessage.numberOfLines = 0
        
        self.secondIcon.image = UIImage(systemName: "2.square")
        self.secondIcon.tintColor = UIColor(named: "GradientColor1")
        self.secondMessage.text = "Melakukan detail pengeluaran kebutuhan yang mungkin kamu keluarkan dalam sebulan."
        self.secondMessage.textColor = UIColor.systemGray
        self.secondMessage.numberOfLines = 0
        
        self.thirdIcon.image = UIImage(systemName: "3.square")
        self.thirdIcon.tintColor = UIColor(named: "GradientColor1")
        self.thirdMessage.text = "Mengestimasi detail pengeluaran tabungan kamu dalam sebulan."
        self.thirdMessage.textColor = UIColor.systemGray
        self.thirdMessage.numberOfLines = 0
        
        self.fourthIcon.image = UIImage(systemName: "4.square")
        self.fourthIcon.tintColor = UIColor(named: "GradientColor1")
        self.fourthMessage.text = "Selesai ! Selanjutnya, kamu bisa melakukan perencanaan pembelian impulsifmu selama sebulan."
        self.fourthMessage.textColor = UIColor.systemGray
        self.fourthMessage.numberOfLines = 0
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
