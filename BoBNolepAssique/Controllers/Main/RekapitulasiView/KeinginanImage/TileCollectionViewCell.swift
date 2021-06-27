//
//  TileCollectionViewCell.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let backgroundColor: UIColor
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileColletionViewCell"
    
    private let label:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds.offsetBy(dx: 0, dy: 100)
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
}
