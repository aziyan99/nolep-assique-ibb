//
//  General+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 21/06/21.
//
//

import Foundation
import CoreData


extension General {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<General> {
        return NSFetchRequest<General>(entityName: "General")
    }

    @NSManaged public var id: Int64
    @NSManaged public var is_send_notif: Bool

}

extension General : Identifiable {

}
