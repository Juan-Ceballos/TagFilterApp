//
//  PlumberCell.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/22/22.
//

import UIKit

class PlumberCell: UICollectionViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var tagLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupNameLabelConstraints()
        tagLabelConstraints()
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
    
    private func tagLabelConstraints() {
        addSubview(tagLabel)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 11),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}

