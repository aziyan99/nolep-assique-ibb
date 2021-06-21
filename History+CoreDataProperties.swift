//
//  History+CoreDataProperties.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 21/06/21.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var id: Int64
    @NSManaged public var bulan: String?
    @NSManaged public var tahun: String?
    @NSManaged public var total_pendapatan: String?
    @NSManaged public var total_kebutuhan: String?
    @NSManaged public var total_investasi: String?
    @NSManaged public var total_keinginan: String?
    @NSManaged public var total_keinginan_yg_dibeli: String?
    @NSManaged public var total_keinginan_yg_gagal_dibeli: String?
    @NSManaged public var is_active: Bool
    @NSManaged public var keinginans: Keinginan?

}

extension History : Identifiable {

}
