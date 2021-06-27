//
//  Investasi+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//
//

import Foundation
import CoreData


extension Investasi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Investasi> {
        return NSFetchRequest<Investasi>(entityName: "Investasi")
    }

    @NSManaged public var harga: String?
    @NSManaged public var jumlah: String?
    @NSManaged public var nama: String?
    @NSManaged public var updated_at: Date?

}

extension Investasi : Identifiable {

}
