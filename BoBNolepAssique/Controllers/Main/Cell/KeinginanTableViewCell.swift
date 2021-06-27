//
//  KeinginanTableViewCell.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//

import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11, *) {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask

        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}

class KeinginanTableViewCell: UITableViewCell {
    static let identifier = "KeinginanTableViewCell"
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "ButtonBrand")?.cgColor
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sideContentStatus: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.clipsToBounds = true
        view.roundCorners([.bottomLeft, .topLeft], radius: 10)
        view.layer.masksToBounds = true
        return view
    }()
    
    let contentImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "ButtonBrandDisable")
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    let contentTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Item 1"
//        label.backgroundColor = .red
        label.numberOfLines = 1
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    
    let contentPriceLabel: UILabel = {
        let attachment = NSTextAttachment()
        let smallConfiguration = UIImage.SymbolConfiguration(scale: .small)
        let symbolName = UIImage(systemName: "creditcard", withConfiguration: smallConfiguration)
        attachment.image = symbolName

        let imageString = NSMutableAttributedString(attachment: attachment)
        let textString = NSAttributedString(string: " Rp ")
        imageString.append(textString)

        let label = UILabel()
        label.attributedText = imageString
        label.sizeToFit()
        label.backgroundColor = .white
        label.numberOfLines = 1
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let contentStatusLabel: UILabel = {
        let attachment = NSTextAttachment()
        let smallConfiguration = UIImage.SymbolConfiguration(scale: .small)
        let symbolName = UIImage(systemName: "clock", withConfiguration: smallConfiguration)
        attachment.image = symbolName
        let imageString = NSMutableAttributedString(attachment: attachment)
        let textString = NSAttributedString(string: " Sudah Terbeli")
        imageString.append(textString)
        
        let label = UILabel()
        label.attributedText = imageString
        label.sizeToFit()
        label.backgroundColor = .green
        label.numberOfLines = 1
        label.baselineAdjustment = .alignCenters
        label.textColor = UIColor.systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(sideContentStatus)
        cellView.addSubview(contentImageContainer)
        cellView.addSubview(contentTextLabel)
        cellView.addSubview(contentPriceLabel)
        cellView.addSubview(contentStatusLabel)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        let paddingLeft = 30
        let betwenPadding = 10
        let startFromTop = 10
        _ = 110
        let size = contentView.frame.size
        
        sideContentStatus.frame = CGRect(x: 0, y: 0, width: 13, height: 90)
        sideContentStatus.backgroundColor = UIColor.green
        
        contentImageContainer.frame = CGRect(x: paddingLeft, y: startFromTop, width: 70, height: 70)
        contentTextLabel.frame = CGRect(x: paddingLeft + Int(contentImageContainer.frame.width) + betwenPadding, y: startFromTop, width: Int(size.width) - (paddingLeft + betwenPadding + Int(contentImageContainer.frame.width)), height: 30)
        contentPriceLabel.frame = CGRect(x: paddingLeft + Int(contentImageContainer.frame.width) + betwenPadding, y: startFromTop + Int(contentTextLabel.frame.height), width: Int(size.width) - (paddingLeft + betwenPadding + Int(contentImageContainer.frame.width)), height: 20)
        contentStatusLabel.frame = CGRect(x: paddingLeft + Int(contentImageContainer.frame.width) + betwenPadding, y: startFromTop + Int(contentPriceLabel.frame.height) + Int(contentTextLabel.frame.height), width: Int(size.width) - (paddingLeft + betwenPadding + Int(contentImageContainer.frame.width)), height: 20)
        
//        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
//        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ////BATAS
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let size = contentView.frame.size.height - 12
//        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
//        let imageSize = size
//        let infoWidth: CGFloat = 100
//
//        label.frame = CGRect(x: 25 + iconContainer.frame.size.width, y: -10, width: contentView.frame.size.width - 20 - iconContainer.frame.size.width - infoWidth, height: contentView.frame.size.height)
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        iconImageView.image = nil
//        label.text = nil
//        iconContainer.backgroundColor = nil
//    }
    
//    public func configure(with model: MapingDataKeinginan) {
//        label.text = model.name
//        subtitle.text = String(model.price)
//    }
}
