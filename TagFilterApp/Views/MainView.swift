//
//  MainView.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/22/22.
//

import UIKit

class MainView: UIView {
    
    static let plumberId = "plumberId"
    
    public lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(PlumberCell.self, forCellWithReuseIdentifier: MainView.plumberId)
        cv.backgroundColor = .blue
        return cv
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
        setupCVConstraints()
    }
    
    private func setupCVConstraints() {
        addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cv.leadingAnchor.constraint(equalTo: leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: trailingAnchor),
            cv.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
