//
//  SisaHelper.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//

import UIKit
import CoreData

struct SisaHelper {
    static let contex: NSManagedObjectContext = {
        guard let appDeletegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistanceContainer = appDeletegate.persistentContainer
        let context = persistanceContainer.viewContext
        
        return context
    }()
    
    static func createSisa() -> Sisa {
        let sisa = NSEntityDescription.insertNewObject(forEntityName: "Sisa", into: contex) as! Sisa
        
        return sisa
    }
    
    static func storeSisa() {
        do {
            try contex.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func getSisa() -> [Sisa] {
        do {
            let fetchRequest = NSFetchRequest<Sisa>(entityName: "Sisa")
            let results = try contex.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    static func destroySisa(sisa: Sisa) {
        contex.delete(sisa)
        storeSisa()
    }
    
    static func emptySisa() {
        let sisa = getSisa()
        for data in sisa {
            destroySisa(sisa: data)
        }
    }
    
}
