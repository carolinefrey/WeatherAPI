//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit
import CoreLocation

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
                    self.contentView.conditionData.text = "\(forecast.current.condition.text)"
                    self.contentView.temperatureDataLabel.text = "\(forecast.current.temp_f)°F"
                    self.contentView.windDataLabel.text = "\(forecast.current.wind_mph) mph"
                    self.contentView.humidityDataLabel.text = "\(forecast.current.humidity)%"

                    // configure weather icon
                    if forecast.current.condition.text == "Sunny" || forecast.current.condition.text == "Clear" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "sun.max.fill")
                    } else if forecast.current.condition.text == "Partly cloudy" || forecast.current.condition.text == "Overcast" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.sun")
                    } else if forecast.current.condition.text == "Cloudy" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.fill")
                    } else if forecast.current.condition.text == "Mist" || forecast.current.condition.text == "Fog" || forecast.current.condition.text == "Freezing fog" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.fog.fill")
                    } else if forecast.current.condition.text == "Patchy rain possible" || forecast.current.condition.text == "Patchy light rain" || forecast.current.condition.text == "Light rain" || forecast.current.condition.text == "Patchy light drizzle" || forecast.current.condition.text == "Light drizzle" || forecast.current.condition.text == "Light rain shower" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.drizzle.fill")
                    } else if forecast.current.condition.text == "Moderate rain at times" || forecast.current.condition.text == "Moderate rain" || forecast.current.condition.text == "Heavy rain at times" || forecast.current.condition.text == "Heavy rain" || forecast.current.condition.text == "Moderate or heavy rain shower" || forecast.current.condition.text == "Torrential rain shower" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.rain.fill")
                    } else if forecast.current.condition.text == "Light freezing rain" || forecast.current.condition.text == "Moderate or heavy freezing rain" || forecast.current.condition.text == "Light sleet" || forecast.current.condition.text == "Moderate or heavy sleet" || forecast.current.condition.text == "Ice pellets" || forecast.current.condition.text == "Freezing drizzle" || forecast.current.condition.text == "Heavy freezing drizzle" || forecast.current.condition.text == "Light sleet showers" || forecast.current.condition.text == "Moderate or heavy sleet showers" || forecast.current.condition.text == "Light showers of ice pellets" || forecast.current.condition.text == "Moderate or heavy showers of ice pellets" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.sleet.fill")
                    } else if forecast.current.condition.text == "Patchy light snow" || forecast.current.condition.text == "Light snow" || forecast.current.condition.text == "Patchy moderate snow" || forecast.current.condition.text == "Moderate snow" || forecast.current.condition.text == "Patchy heavy snow" || forecast.current.condition.text == "Heavy snow" || forecast.current.condition.text == "Light snow showers" || forecast.current.condition.text == "Moderate or heavy snow showers" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.snow.fill")
                    } else if forecast.current.condition.text == "Patchy light rain with thunder" || forecast.current.condition.text == "Moderate or heavy rain with thunder" || forecast.current.condition.text == "Patchy light snow with thunder" || forecast.current.condition.text == "Moderate or heavy snow with thunder" {
                        self.contentView.configureWeatherData(forCity: city, withIcon: "cloud.bolt.rain")
                    }
                } else {
                    print("Temperature not found")
                }
            }
        }
    }
    
    class LocationDataManager: NSObject, CLLocationManagerDelegate {
        var locationManager = CLLocationManager()
        
        override init() {
            super.init()
            locationManager.delegate = self
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                    //enableLocationFeatures()
                    break
                    
                case .restricted, .denied:  // Location services currently unavailable.
                    //disableLocationFeatures()
                    break
                    
                case .notDetermined:        // Authorization not determined yet.
                   manager.requestWhenInUseAuthorization()
                    break
                    
                default:
                    break
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
