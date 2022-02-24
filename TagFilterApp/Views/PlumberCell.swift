//
//  PlumberCell.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/22/22.
//

import UIKit

class PlumberCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        photoView.layer.cornerRadius = 8
    }
    
    var photoView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemTeal
        iv.image = UIImage(systemName: "person")
        return iv
    }()
    
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
        setupPhotoViewConstraints()
        setupNameLabelConstraints()
        tagLabelConstraints()
    }
    
    private func setupPhotoViewConstraints() {
        addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            photoView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
            photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor)
            
        ])
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 11),
            nameLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 11)
        ])
        
    }
    
    private func tagLabelConstraints() {
        addSubview(tagLabel)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 11),
            tagLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 11)
        ])
    }
    
}

