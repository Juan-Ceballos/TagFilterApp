//
//  MainView.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/22/22.
//

import UIKit

class MainView: UIView {
    
    static let plumberId = "plumberId"
    
    override func layoutSubviews() {
        friendlyButton.layer.cornerRadius = 8
        punctualButton.layer.cornerRadius = 8
        educationalButton.layer.cornerRadius = 8
        affordableButton.layer.cornerRadius = 8
    }
    
    public lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(PlumberCell.self, forCellWithReuseIdentifier: MainView.plumberId)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    var tagView: UIView = {
        let uiv = UIView()
        uiv.backgroundColor = .systemBackground
        uiv.layer.borderWidth = 1
        uiv.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        return uiv
    }()
    
    var friendlyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemTeal
        button.setTitle("Friendly", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        return button
    }()
    
    var punctualButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemTeal
        button.setTitle("Punctual", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        return button
    }()
    
    var educationalButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemTeal
        button.setTitle("Educational", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        return button
    }()
    
    var affordableButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemTeal
        button.setTitle("Affordable", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        return button
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
        setupTagViewConstraints()
        setupCVConstraints()
    }
    
    private func setupTagViewConstraints() {
        addSubview(tagView)
        tagView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagView.widthAnchor.constraint(equalTo: widthAnchor),
            tagView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        
        ])
        tagView.addSubview(friendlyButton)
        friendlyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            friendlyButton.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 11),
            friendlyButton.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 11),
            friendlyButton.widthAnchor.constraint(equalTo: tagView.widthAnchor, multiplier: 0.225),
            friendlyButton.heightAnchor.constraint(equalTo: tagView.heightAnchor, multiplier: 0.2)
        ])
        tagView.addSubview(punctualButton)
        punctualButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            punctualButton.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 11),
            punctualButton.leadingAnchor.constraint(equalTo: friendlyButton.trailingAnchor, constant: 11),
            punctualButton.widthAnchor.constraint(equalTo: tagView.widthAnchor, multiplier: 0.225),
            punctualButton.heightAnchor.constraint(equalTo: tagView.heightAnchor, multiplier: 0.2)
        ])
        tagView.addSubview(educationalButton)
        educationalButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            educationalButton.topAnchor.constraint(equalTo: friendlyButton.bottomAnchor, constant: 11),
            educationalButton.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 11),
            educationalButton.widthAnchor.constraint(equalTo: tagView.widthAnchor, multiplier: 0.225),
            educationalButton.heightAnchor.constraint(equalTo: tagView.heightAnchor, multiplier: 0.2)
        ])
        tagView.addSubview(affordableButton)
        affordableButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            affordableButton.topAnchor.constraint(equalTo: punctualButton.bottomAnchor, constant: 11),
            affordableButton.leadingAnchor.constraint(equalTo: educationalButton.trailingAnchor, constant: 11),
            affordableButton.widthAnchor.constraint(equalTo: tagView.widthAnchor, multiplier: 0.225),
            affordableButton.heightAnchor.constraint(equalTo: tagView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func setupCVConstraints() {
        addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: tagView.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: trailingAnchor),
            cv.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
