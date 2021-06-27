//
//  NumberFormatter.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//

import Foundation

func cleanCharacter(val: String) -> String {
    let cleanNumber = val.replacingOccurrences(of: "[abcdefghijklmnopqrstuvwqyz.,;'\"/?!@#$%^&*()]", with: "", options: [.regularExpression, .caseInsensitive])
    let finalResult = cleanNumber.trimmingCharacters(in: .whitespaces)
    return finalResult
}
