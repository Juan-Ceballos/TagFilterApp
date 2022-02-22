//
//  ViewController.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView = MainView()
    let plumbers = Plumber.getPlumbers()

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        mainView.cv.dataSource = self
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
        return cell
    }
    
    
}



