//
//  KebutuhanHelper.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//

import UIKit
import CoreData

struct KebutuhanHelper {
    static let contex: NSManagedObjectContext = {
        guard let appDeletegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistanceContainer = appDeletegate.persistentContainer
        let context = persistanceContainer.viewContext
        
        return context
    }()
    
    static func createKebutuhan() -> Kebutuhan {
        let kebutuhan = NSEntityDescription.insertNewObject(forEntityName: "Kebutuhan", into: contex) as! Kebutuhan
        
        return kebutuhan
    }
    
    static func storeKebutuhan() {
        do {
            try contex.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func getKebutuhan() -> [Kebutuhan] {
        do {
            let fetchRequest = NSFetchRequest<Kebutuhan>(entityName: "Kebutuhan")
            let results = try contex.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    static func destroyKebutuhan(kebutuhan: Kebutuhan) {
        contex.delete(kebutuhan)
        storeKebutuhan()
    }
    
    static func emptyKebutuhan() {
        let kebutuhan = getKebutuhan()
        for data in kebutuhan {
            destroyKebutuhan(kebutuhan: data)
        }
    }
    
}
