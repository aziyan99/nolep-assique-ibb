//
//  StructCell.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//


import Foundation
import UIKit

struct SectionDetailIntro {
    let title: String
    let options: [TableInputTypeIntro]
    let footer: String
}

enum TableInputTypeIntro {
    case switchCell(model: TableInputDetailsIntro)
}
struct TableInputDetailsIntro {
    let title: String
    let icon: UIImage?
    let iconBackgrounColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}
