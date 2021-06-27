//
//  PendapatanHelper.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//

import UIKit
import CoreData

struct PendapatanHelper {
    static let contex: NSManagedObjectContext = {
        guard let appDeletegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistanceContainer = appDeletegate.persistentContainer
        let context = persistanceContainer.viewContext
        
        return context
    }()
    
    static func createPendapatan() -> Pendapatan {
        let pendapatan = NSEntityDescription.insertNewObject(forEntityName: "Pendapatan", into: contex) as! Pendapatan
        
        return pendapatan
    }
    
    static func storePendapatan() {
        do {
            try contex.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func getPendapatan() -> [Pendapatan] {
        do {
            let fetchRequest = NSFetchRequest<Pendapatan>(entityName: "Pendapatan")
            let results = try contex.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    static func destroyPendapatan(pendapatan: Pendapatan) {
        contex.delete(pendapatan)
        storePendapatan()
    }
    
    static func emptyPendapatan() {
        let pendapatan = getPendapatan()
        for data in pendapatan {
            destroyPendapatan(pendapatan: data)
        }
    }
    
}
