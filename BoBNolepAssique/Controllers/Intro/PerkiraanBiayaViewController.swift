//
//  PerkiraanBiayaViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit

class PerkiraanBiayaViewController: ViewController {
    final var window: UIWindow?
    @IBOutlet weak var btnSelesai: UIButton!
    @IBOutlet weak var btnUlangi: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perkiraan Biaya"
        self.btnSelesai.setTitle("Selesai", for: UIControl.State.normal)
        self.btnUlangi.setTitle("Ulangi", for: UIControl.State.normal)
    }

    @IBAction func didTapSelesaiBtn(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func didTapUlangiBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
