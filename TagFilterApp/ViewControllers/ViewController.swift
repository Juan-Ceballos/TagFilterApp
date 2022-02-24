//
//  ViewController.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView = MainView()

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        mainView.cv.dataSource = self
        mainView.friendlyButton.addTarget(self, action: #selector(friendlyButtonPressed), for: .touchUpInside)
        mainView.punctualButton.addTarget(self, action: #selector(friendlyButtonPressed), for: .touchUpInside)
        mainView.educationalButton.addTarget(self, action: #selector(friendlyButtonPressed), for: .touchUpInside)
        mainView.affordableButton.addTarget(self, action: #selector(friendlyButtonPressed), for: .touchUpInside)
    }
    
    private var friendlyButtonOff = false {
        didSet {
            if friendlyButtonOff {
                mainView.friendlyButton.backgroundColor = .systemFill
                currentTags.append("friendly")
            } else {
                mainView.friendlyButton.backgroundColor = .systemTeal
                currentTags = currentTags.filter{$0 != "friendly"}
            }
        }
    }
    
    private var punctualButtonOff = false {
        didSet {
            if punctualButtonOff {
                mainView.punctualButton.backgroundColor = .systemFill
                currentTags.append("punctual")
            } else {
                mainView.punctualButton.backgroundColor = .systemTeal
                currentTags = currentTags.filter{$0 != "punctual"}
            }
        }
    }
    
    private var educationalButtonOff = false {
        didSet {
            if educationalButtonOff {
                mainView.educationalButton.backgroundColor = .systemFill
                currentTags.append("educational")
            } else {
                mainView.educationalButton.backgroundColor = .systemTeal
                currentTags = currentTags.filter{$0 != "educational"}
            }
        }
    }
    
    private var affordableButtonOff = false {
        didSet {
            if affordableButtonOff {
                mainView.affordableButton.backgroundColor = .systemFill
                currentTags.append("affordable")
            } else {
                mainView.affordableButton.backgroundColor = .systemTeal
                currentTags = currentTags.filter{$0 != "affordable"}
            }
        }
    }
    
    @objc func friendlyButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if friendlyButtonOff == false {
                friendlyButtonOff = true
            } else {
                friendlyButtonOff = false
            }
        case 1:
            if punctualButtonOff == false {
                punctualButtonOff = true
            } else {
                punctualButtonOff = false
            }
        case 2:
            if educationalButtonOff == false {
                educationalButtonOff = true
            } else {
                educationalButtonOff = false
            }
        case 3:
            if affordableButtonOff == false {
                affordableButtonOff = true
            } else {
                affordableButtonOff = false
            }
        default:
            break
        }
        
    }
    
    private func filterTags(tags: [String]) -> [Plumber] {
        plumbers = Plumber.getPlumbers()
        for tag in tags {
            plumbers = plumbers.filter{$0.tags.contains(tag)}
        }
        
        return plumbers
    }
    
    private var currentTags = [String]() {
        didSet {
            plumbers = filterTags(tags: currentTags)
        }
    }
    
    private var plumbers = Plumber.getPlumbers() {
        didSet {
            mainView.cv.reloadData()
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        plumbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainView.plumberId, for: indexPath) as? PlumberCell else {
            fatalError()
        }
        let plumber = plumbers[indexPath.row]
        cell.nameLabel.text = plumber.name
        cell.tagLabel.text = plumber.tags.joined(separator: ", ")
        return cell
    }
    
    
}



