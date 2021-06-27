//
//  RekapitulasiViewController.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 17/06/21.
//


import UIKit

class RekapitulasiViewController: ViewController {
    
    let rekapitulasiHeader = RekapitulasiHeaderViewController()
    let keinginanImage = KeinginanImageViewController()
    let aktivitasBulanan = AktivitasBulananViewController()
    
    // MARK: - ScrollView
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height - 100)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = true
        view.bounces = true
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()

    // MARK: - View Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rekapitulasi"
        view.backgroundColor = UIColor(displayP3Red: 242 / 255, green: 242 / 255, blue: 247 / 255, alpha: 100)
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        addHeader()
        addKeinginanImage()
        addAktivitasBulanan()
    }
    
    func addHeader() {
        addChild(rekapitulasiHeader)
        containerView.addSubview(rekapitulasiHeader.view)
        rekapitulasiHeader.view.backgroundColor = UIColor(displayP3Red: 242 / 255, green: 242 / 255, blue: 247 / 255, alpha: 100)
        rekapitulasiHeader.didMove(toParent: self)
        setHeaderConstraits()
    }
    
    func setHeaderConstraits() {
        rekapitulasiHeader.view.translatesAutoresizingMaskIntoConstraints = false
        rekapitulasiHeader.view.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        rekapitulasiHeader.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        rekapitulasiHeader.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        rekapitulasiHeader.view.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func addKeinginanImage() {
        addChild(keinginanImage)
        containerView.addSubview(keinginanImage.view)
        keinginanImage.didMove(toParent: self)
        setKeinginanImageConstraits()
    }
    
    func setKeinginanImageConstraits() {
        keinginanImage.view.translatesAutoresizingMaskIntoConstraints = false
        keinginanImage.view.topAnchor.constraint(equalTo: rekapitulasiHeader.view.bottomAnchor, constant: 40).isActive = true
        keinginanImage.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        keinginanImage.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        keinginanImage.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func addAktivitasBulanan() {
        addChild(aktivitasBulanan)
        containerView.addSubview(aktivitasBulanan.view)
        aktivitasBulanan.didMove(toParent: self)
        setAktivitasBConstraits()
    }
    
    func setAktivitasBConstraits() {
        aktivitasBulanan.view.translatesAutoresizingMaskIntoConstraints = false
        aktivitasBulanan.view.topAnchor.constraint(equalTo: keinginanImage.view.bottomAnchor, constant: 40).isActive = true
        aktivitasBulanan.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        aktivitasBulanan.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        aktivitasBulanan.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
}
