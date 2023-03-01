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
        contentView.cityPicker.dataSource = self
        contentView.cityPicker.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather(city: "Denver")
    }
    
    // MARK: - Functions
    
    private func fetchWeather(city: String) {
        fetchWeatherData(city: city) { forecast, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.contentView.temperature.text = "\(forecast.TempF)°"
                    switch forecast.Weather {
                    case "Fair":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "sun.min.fill")
                    case "Partly Cloudy":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.sun")
                    case "A Few Clouds":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.sun")
                    case "Mostly Cloudy":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.fill")
                    case "Light Drizzle":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.drizzle")
                    case "Light Rain":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.drizzle")
                    case "Rain":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.heavyrain")
                    case "Fog/Mist":
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "cloud.fog.fill")
                    default:
                        self.contentView.configureWeatherData(forCity: "Denver", withIcon: "sun.max.fill")
                    }
                } else {
                    print("Temperature not found")
                }
            }
        }
    }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contentView.cityOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fetchWeather(city: self.contentView.cityOptions[row])
    }
}
