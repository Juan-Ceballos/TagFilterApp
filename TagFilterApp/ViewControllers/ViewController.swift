//
//  ViewController.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/21/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let plumbers = Plumber.getPlumbers()
        print(plumbers.count)
    }


}

