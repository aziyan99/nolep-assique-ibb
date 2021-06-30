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
    
    var sampleFormatData :[MapingDataKeinginan] = []
    var formatData: [MapingDataKeinginan] = []
    
    let keinginanTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
    
    func getDataKeinginan(isFilter: Bool, filterValue: String) {
        let keinginanRequest: NSFetchRequest<Keinginan> = Keinginan.fetchRequest()
        if isFilter && filterValue != "" {
            keinginanRequest.predicate = NSPredicate(format: "nama BEGINSWITH[cd] %@", filterValue)
        }
        do {
            try keinginanList = managedObjectContext.fetch(keinginanRequest)
        } catch {
            print("Couldn't load the keinginan data!")
        }
        formatData = []
        self.mappingFormatData()
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
        keinginanTableView.separatorColor = UIColor.clear
    }
    
    func mappingFormatData() {
        for i in keinginanList {
            let sumHarga = (Int(i.jumlah) * Int(i.harga!)!)
            formatData.append(MapingDataKeinginan(name: i.nama ?? "", price: sumHarga, expired: i.status ?? ""))
        }
    }
    
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
        
        setupSearchBar()
        setupNavbar()
        setupTableView()
        
        getDataKeinginan(isFilter: isFilter, filterValue: filterValue)
    }
}

extension KeinginanViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.getDataKeinginan(isFilter: true, filterValue: searchText)
    }
}

extension KeinginanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formatData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indexRow = indexPath.row
        _ = indexPath.section
        let cell = keinginanTableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! KeinginanTableViewCell
        cell.backgroundColor = UIColor.white
            cell.contentTextLabel.text = formatData[indexRow].name
            
            let attachment1 = NSTextAttachment()
            let smallConfiguration1 = UIImage.SymbolConfiguration(scale: .small)
            let symbolName1 = UIImage(systemName: "creditcard", withConfiguration: smallConfiguration1)
            attachment1.image = symbolName1
            let imageString1 = NSMutableAttributedString(attachment: attachment1)
            let textString1 = NSAttributedString(string: " Rp " + String(formatData[indexRow].price))
            imageString1.append(textString1)
            cell.contentPriceLabel.attributedText = imageString1
            
            
            let attachment = NSTextAttachment()
            let smallConfiguration = UIImage.SymbolConfiguration(scale: .small)
            let symbolName = UIImage(systemName: "clock", withConfiguration: smallConfiguration)
            attachment.image = symbolName
            let imageString = NSMutableAttributedString(attachment: attachment)
            let textString = NSAttributedString(string: " " + formatData[indexRow].expired)
            imageString.append(textString)
            cell.contentStatusLabel.attributedText = imageString
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = indexPath.section
        _ = indexPath.row
        
        self.performSegue(withIdentifier: "addKeinginan", sender: nil)
    }
}
