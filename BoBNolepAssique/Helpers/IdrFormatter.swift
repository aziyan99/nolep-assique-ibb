//
//  IdrFormatter.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//

import Foundation

func idrFormatter(val: String) -> String {
    //casting
    let preVal = (val as NSString).doubleValue
    let processVal = NSNumber(value: preVal)
    
    // formatter
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    guard let resultVal = formatter.string(from: processVal as NSNumber) else {
        return "0.0"
    }
    return "Rp \(resultVal)"
}
