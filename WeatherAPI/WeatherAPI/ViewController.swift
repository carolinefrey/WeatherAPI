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
    var selectedCity = "Denver"

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
        fetchWeatherData(city: selectedCity) { forecast, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.contentView.temperature.text = "\(forecast.TempF)°"
                    switch forecast.Weather {
                    case "Fair":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "sun.min.fill")
                    case "Partly Cloudy":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.sun")
                    case "A Few Clouds":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.sun")
                    case "Mostly Cloudy":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.fill")
                    case "Light Drizzle":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.drizzle")
                    case "Light Rain":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.drizzle")
                    case "Rain":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.heavyrain")
                    case "Fog/Mist":
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "cloud.fog.fill")
                    default:
                        self.contentView.configureWeatherData(forCity: self.selectedCity, withIcon: "sun.max.fill")
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
        fetchWeatherData(city: self.contentView.cityOptions[row]) { forecast, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.contentView.temperature.text = "\(forecast.TempF)°"
                    switch forecast.Weather {
                    case "Fair":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "sun.min.fill")
                    case "Partly Cloudy":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.sun")
                    case "A Few Clouds":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.sun")
                    case "Mostly Cloudy":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.fill")
                    case "Light Drizzle":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.drizzle")
                    case "Light Rain":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.drizzle")
                    case "Rain":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.heavyrain")
                    case "Fog/Mist":
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "cloud.fog.fill")
                    default:
                        self.contentView.configureWeatherData(forCity: self.contentView.cityOptions[row], withIcon: "sun.max.fill")
                    }
                } else {
                    print("Temperature not found")
                }
            }
        }
    }
}
