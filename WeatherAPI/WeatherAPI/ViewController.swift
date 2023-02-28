//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Properties
    
    private var contentView: MainContentView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = MainContentView()
        view = contentView
    }
}

