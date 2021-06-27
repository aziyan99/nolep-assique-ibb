//
//  AktivitasBulananViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//

import UIKit
import SwiftUI

class AktivitasBulananViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        extractView()
    }
    
    func extractView() {
        
        let hostView = UIHostingController(rootView: AktivitasBulanan())
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(hostView.view)
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
        ]
        
        self.view.addConstraints(constraints)
    }
}
