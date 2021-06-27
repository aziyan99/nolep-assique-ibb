//
//  EditInvestasiTableViewCell.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 25/06/21.
//

import UIKit

class EditInvestasiTableViewCell: UITableViewCell {

    static let identifier = "EditInvestasiTableViewCell"
    
    public let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    public let textInputField: UITextField = {
        let textInput = UITextField()
        return textInput
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(textInputField)
        
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 25, y: 0, width: contentView.frame.size.width/4 , height: contentView.frame.size.height)
        textInputField.frame = CGRect(x: contentView.frame.size.width/4 + 25, y: 0, width: contentView.frame.size.width - contentView.frame.size.width/4, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        textInputField.text = nil
    }
    
    public func configure(with model: TableInputDetailsIntro) {
        label.text = model.title
    }

}
