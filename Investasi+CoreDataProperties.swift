//
//  Investasi+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 21/06/21.
//
//

import Foundation
import CoreData


extension Investasi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Investasi> {
        return NSFetchRequest<Investasi>(entityName: "Investasi")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nama: String?
    @NSManaged public var harga: String?
    @NSManaged public var updated_at: Date?

}

extension Investasi : Identifiable {

}
