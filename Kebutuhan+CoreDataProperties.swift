//
//  Kebutuhan+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 21/06/21.
//
//

import Foundation
import CoreData


extension Kebutuhan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kebutuhan> {
        return NSFetchRequest<Kebutuhan>(entityName: "Kebutuhan")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nama: String?
    @NSManaged public var harga: String?
    @NSManaged public var updated_at: Date?

}

extension Kebutuhan : Identifiable {

}
