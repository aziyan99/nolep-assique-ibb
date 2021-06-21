//
//  Pendapatan+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 21/06/21.
//
//

import Foundation
import CoreData


extension Pendapatan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pendapatan> {
        return NSFetchRequest<Pendapatan>(entityName: "Pendapatan")
    }

    @NSManaged public var id: Int64
    @NSManaged public var total: String?
    @NSManaged public var updated_at: Date?

}

extension Pendapatan : Identifiable {

}
