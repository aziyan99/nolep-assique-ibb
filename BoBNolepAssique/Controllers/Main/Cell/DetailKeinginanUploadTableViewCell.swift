//
//  DetailKeinginanUploadTableViewCell.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//
import UIKit

class DetailKeinginanUploadTableViewCell: UITableViewCell {
    static let identifier = "DetailKeinginanUploadTableViewCell"
    
    private let uploadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "ButtonBrand")
        return button
    }()
    
    @objc func uploadButtonTapped() {
        print("BUTTON TAPPED")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(uploadButton)
        contentView.clipsToBounds = true
        accessoryType = .none
        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        uploadButton.contentEdgeInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0);
        uploadButton.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 50)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        uploadButton.setTitle("", for: .normal)
    }
    
    public func configure(with model: TableUploadImage) {
        uploadButton.setTitle(String(model.title), for: .normal)
    }
}

class DetailKeinginanNoteTableViewCell: UITableViewCell {
    static let identifier = "DetailKeinginanNoteTableViewCell"
    
    private let textInputField: UITextField = {
        let textInput = UITextField()
        textInput.placeholder = "Tuliskan catatan ..."
        textInput.autocorrectionType = .no
        textInput.clearButtonMode = .whileEditing
        textInput.font = UIFont.systemFont(ofSize: 17.0)
        return textInput
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textInputField)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textInputField.frame = CGRect(x: 25, y: 0, width: contentView.frame.size.width - 25, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textInputField.text = nil
    }
    
    public func configure(with model: TableInputNote) {
        textInputField.text = model.description
    }
    
}

class DetailKeinginanSwitchTableViewCell: UITableViewCell {
    static let identifier = "DetailKeinginanSwitchTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17.0)
        return label
    }()
    
    private let switcher: UISwitch = {
        let swtich = UISwitch()
        swtich.onTintColor = .systemGreen
        return swtich
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(switcher)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switcher.sizeToFit()
        switcher.frame = CGRect(x: (contentView.frame.size.width - switcher.frame.size.width) - 20, y: (contentView.frame.size.height - switcher.frame.size.height)/2, width: switcher.frame.size.width, height: switcher.frame.size.height)
        
        label.frame = CGRect(x: 25, y: 0, width: contentView.frame.size.width - 20, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        switcher.isOn = false
    }
    
    public func configure(with model: TableInputStatus) {
        label.text = model.title
        switcher.isOn = model.isOn
    }
    
}

class DetailKeinginanTableViewCell: UITableViewCell {
    static let identifier = "DetailKeinginanTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17.0)
        return label
    }()
    
    private let textInputField: UITextField = {
        let textInput = UITextField()
        textInput.placeholder = "Default"
        textInput.autocorrectionType = .no
        textInput.clearButtonMode = .whileEditing
        textInput.font = UIFont.systemFont(ofSize: 17.0)
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
        let sizeButtonClear = 35
        label.frame = CGRect(x: 25, y: 0, width: contentView.frame.size.width/4 , height: contentView.frame.size.height)
        textInputField.frame = CGRect(x: contentView.frame.size.width/4 + 25, y: 0, width: contentView.frame.size.width - contentView.frame.size.width/4 - CGFloat(sizeButtonClear), height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        textInputField.text = nil
    }
    
    public func configure(with model: TableInputDetails) {
        label.text = model.title
    }
}
