//
//  Keinginan+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 23/06/21.
//
//

import Foundation
import CoreData


extension Keinginan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Keinginan> {
        return NSFetchRequest<Keinginan>(entityName: "Keinginan")
    }

    @NSManaged public var catatan: String?
    @NSManaged public var foto: Data?
    @NSManaged public var harga: String?
    @NSManaged public var id: Int64
    @NSManaged public var is_active: Bool
    @NSManaged public var jumlah: Int64
    @NSManaged public var lokasi: String?
    @NSManaged public var nama: String?
    @NSManaged public var status: String?
    @NSManaged public var updated_at: Date?
    @NSManaged public var ofHistory: History?

}

extension Keinginan : Identifiable {

}
