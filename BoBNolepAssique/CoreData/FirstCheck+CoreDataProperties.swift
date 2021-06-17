//
//  FirstCheck+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//
//

import Foundation
import CoreData


extension FirstCheck {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FirstCheck> {
        return NSFetchRequest<FirstCheck>(entityName: "FirstCheck")
    }

    @NSManaged public var is_first: Bool

}

extension FirstCheck : Identifiable {

}
