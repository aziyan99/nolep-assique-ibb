//
//  Sisa+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//
//

import Foundation
import CoreData


extension Sisa {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sisa> {
        return NSFetchRequest<Sisa>(entityName: "Sisa")
    }

    @NSManaged public var total: String?

}

extension Sisa : Identifiable {

}
