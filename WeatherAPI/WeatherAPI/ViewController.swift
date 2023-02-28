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
    
    override func loadView() {
        super.loadView()
        contentView = MainContentView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeatherData { forecast, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.contentView.temperature.text = "\(String(format: "%.0f", forecast.currently.temperature))°"
                } else {
                    print("Temperature not found")
                }
            }
        }
    }
}
