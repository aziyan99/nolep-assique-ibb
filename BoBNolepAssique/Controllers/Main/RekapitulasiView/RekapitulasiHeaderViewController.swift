//
//  RekapitulasiHeaderViewController.swift
//  BoBNolepAssique
//
//  Created by Sukma Risfa Sam Bima Yudha on 24/06/21.
//

import UIKit

class RekapitulasiHeaderViewController: UIViewController {
    
    // MARK: - View Controller LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: - Balance
        addSisaBudget()
        addPengeluaran()

    }
    
    func addSisaBudget() {
        // Background Shape
        let rectangle = UIImage(named: "Rectangle.png")
        let bgView:UIImageView = UIImageView()
        
        // Simbol chevron
        let chevronUp = UIImage(systemName: "chevron.up")
        let chevronUpView:UIImageView = UIImageView()
        
        // Label Sisa Budget
        let labelSisaBudget = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        // Label total Uang
        let valueBalance = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        
        bgView.contentMode = UIView.ContentMode.scaleAspectFit
        bgView.frame.size.width = 155
        bgView.frame.size.height = 60
        bgView.frame.origin.x = 10
        bgView.frame.origin.y = 10
        bgView.image = rectangle
        view.addSubview(bgView)
        
        chevronUpView.contentMode = UIView.ContentMode.scaleAspectFit
        chevronUpView.frame.size.width = 20
        chevronUpView.frame.size.height = 20
        chevronUpView.frame.origin.x = bgView.frame.origin.x + 15
        chevronUpView.frame.origin.y = 15
        chevronUpView.image = chevronUp
        chevronUpView.tintColor = .systemGreen
        view.addSubview(chevronUpView)
        
        labelSisaBudget.text = "Sisa Budget"
        labelSisaBudget.font = UIFont.systemFont(ofSize: 15)
        labelSisaBudget.center = CGPoint(x: bgView.center.x + 15, y: bgView.center.y - 15)
        labelSisaBudget.textAlignment = .center
        view.addSubview(labelSisaBudget)
        
        valueBalance.text = "Rp 900.000,-"
        valueBalance.font = UIFont.boldSystemFont(ofSize: 20)
        valueBalance.center = CGPoint(x: bgView.center.x, y: bgView.center.y + 10)
        valueBalance.textAlignment = .center
        view.addSubview(valueBalance)
    }
    
    func addPengeluaran() {
        // Background Shape
        let rectangle = UIImage(named: "Rectangle.png")
        let bgView:UIImageView = UIImageView()
        
        // Simbol chevron
        let chevronDown = UIImage(systemName: "chevron.down")
        let chevronDownView:UIImageView = UIImageView()
        
        // Label Sisa Budget
        let labelSisaBudget = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        // Label total Uang
        let valueBalance = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        
        bgView.contentMode = UIView.ContentMode.scaleAspectFit
        bgView.frame.size.width = 155
        bgView.frame.size.height = 60
        bgView.frame.origin.x = 180
        bgView.frame.origin.y = 10
        bgView.image = rectangle
        view.addSubview(bgView)
        
        chevronDownView.contentMode = UIView.ContentMode.scaleAspectFit
        chevronDownView.frame.size.width = 20
        chevronDownView.frame.size.height = 20
        chevronDownView.frame.origin.x = bgView.frame.origin.x + 15
        chevronDownView.frame.origin.y = 15
        chevronDownView.image = chevronDown
        chevronDownView.tintColor = .systemRed
        view.addSubview(chevronDownView)
        
        labelSisaBudget.text = "Pengeluaran"
        labelSisaBudget.font = UIFont.systemFont(ofSize: 15)
        labelSisaBudget.center = CGPoint(x: bgView.center.x + 15, y: bgView.center.y - 15)
        labelSisaBudget.textAlignment = .center
        view.addSubview(labelSisaBudget)
        
        valueBalance.text = "Rp 00,-"
        valueBalance.font = UIFont.boldSystemFont(ofSize: 20)
        valueBalance.center = CGPoint(x: bgView.center.x, y: bgView.center.y + 10)
        valueBalance.textAlignment = .center
        view.addSubview(valueBalance)
    }
    

}
