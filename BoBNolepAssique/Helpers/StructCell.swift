//
//  StructCell.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//


import Foundation
import UIKit

struct SectionDetail {
    let title: String
    let options: [TableInputType]
    let footer: String
}

enum TableInputType {
    case switchCell(model: TableInputDetails)
}
struct TableInputDetails {
    let title: String
    let icon: UIImage?
    let iconBackgrounColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}
