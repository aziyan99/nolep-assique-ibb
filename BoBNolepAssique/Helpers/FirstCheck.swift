//
//  FirstCheck.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import Foundation
import UIKit
import CoreData

let isFirstTime = UserDefaults.standard
let keyFirstTime = "First time huh"

func isFirstTimeHuh() -> Bool {
    return isFirstTime.bool(forKey: keyFirstTime)
}
