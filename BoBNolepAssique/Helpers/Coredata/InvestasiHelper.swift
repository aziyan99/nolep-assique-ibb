//
//  InvestasiHelper.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 27/06/21.
//
import UIKit
import CoreData

struct InvestasiHelper {
    static let contex: NSManagedObjectContext = {
        guard let appDeletegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistanceContainer = appDeletegate.persistentContainer
        let context = persistanceContainer.viewContext
        
        return context
    }()
    
    static func createInvestasi() -> Investasi {
        let investasi = NSEntityDescription.insertNewObject(forEntityName: "Investasi", into: contex) as! Investasi
        
        return investasi
    }
    
    static func storeInvestasi() {
        do {
            try contex.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func getInvestasi() -> [Investasi] {
        do {
            let fetchRequest = NSFetchRequest<Investasi>(entityName: "Investasi")
            let results = try contex.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    static func destroyInvestasi(investasi: Investasi) {
        contex.delete(investasi)
        storeInvestasi()
    }
    
    static func emptyKebutuhan() {
        let investasi = getInvestasi()
        for data in investasi {
            destroyInvestasi(investasi: data)
        }
    }
    
}
import Foundation
