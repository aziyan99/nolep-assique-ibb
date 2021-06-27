//
//  KeinginanViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//

import UIKit
import CoreData

struct MapingDataKeinginan {
    var name: String
    var price: Int
    var expired: String
}

class KeinginanViewController: ViewController {
    let searchKeinginan = UISearchController(searchResultsController: nil)
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var isFilter: Bool = false
    var filterValue :String = ""
    
    var keinginanList = [Keinginan]()
    
    let keinginanTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = UIColor.white
        return tableView
    }()
    
    func getDataKeinginan(isFilter: Bool, filterValue: String) {
        let keinginanRequest: NSFetchRequest<Keinginan> = Keinginan.fetchRequest()
        if isFilter && filterValue != "" {
            keinginanRequest.predicate = NSPredicate(format: "name BEGINSWITH[cd] %@", filterValue)
        }
        do {
            try keinginanList = managedObjectContext.fetch(keinginanRequest)
        } catch {
            print("Couldn't load the keinginan data!")
        }
        print(keinginanList.count, "BBC", keinginanList)
        self.keinginanTableView.reloadData()
    }

    func setupTableView() {
        keinginanTableView.delegate = self
        keinginanTableView.dataSource = self
        keinginanTableView.register(KeinginanTableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(keinginanTableView)
        NSLayoutConstraint.activate([
            keinginanTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            keinginanTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            keinginanTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            keinginanTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    var sampleFormatData :[MapingDataKeinginan] = []
    
    func getDefaultData() {
        sampleFormatData.append(MapingDataKeinginan(name: "Action Figure", price: 200000, expired: "2 Hari"))
        sampleFormatData.append(MapingDataKeinginan(name: "Soto Ayam Buk Darmi", price: 15000, expired: "3 Hari"))
        sampleFormatData.append(MapingDataKeinginan(name: "Action Figure", price: 200000, expired: "2 Hari"))
        sampleFormatData.append(MapingDataKeinginan(name: "Soto Ayam Buk Darmi", price: 15000, expired: "3 Hari"))
    }
    
    @objc func addTapped() {
        self.performSegue(withIdentifier: "addKeinginan", sender: nil)
    }
    
    func setupNavbar() {
        self.navigationItem.title = "Keinginan"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let GradientColor1 = UIColor(named: "GradientColor1")
        _ = UIColor(named: "GradientColor2")
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = GradientColor1
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchKeinginan
        searchKeinginan.searchBar.searchTextField.textColor = .darkGray
        searchKeinginan.searchBar.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        searchKeinginan.searchBar.tintColor = .darkGray
        searchKeinginan.searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        
        getDefaultData()
        setupSearchBar()
        setupNavbar()
        setupTableView()
        
        getDataKeinginan(isFilter: isFilter, filterValue: filterValue)
    }
}

extension KeinginanViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

extension KeinginanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleFormatData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexRow = indexPath.row
        _ = indexPath.section
        let cell = keinginanTableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! KeinginanTableViewCell
        cell.backgroundColor = UIColor.white
        cell.contentTextLabel.text = sampleFormatData[indexRow].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = indexPath.section
        _ = indexPath.row
        
        self.performSegue(withIdentifier: "addKeinginan", sender: nil)
    }
}
