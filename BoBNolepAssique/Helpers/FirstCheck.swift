//
//  FirstCheck.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import Foundation
import UIKit
import CoreData

let isFirst = UserDefaults.standard

func firstTimeHuh () -> Bool {
    if isFirst.bool(forKey: "First time huh") == false {
        isFirst.setValue(true, forKey: "First time huh")
        return true
    }else{
        return true
    }
}
