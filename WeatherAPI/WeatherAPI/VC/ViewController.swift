//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - UI Properties
    
    private var contentView: MainContentView!
    
    var locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        contentView = MainContentView()
        view = contentView
//        contentView.cityPicker.dataSource = self
//        contentView.cityPicker.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserLocation()
    }
    
    // MARK: - Functions
    
    private func getUserLocation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            print(city + ", " + country)
            self.fetchWeather(city: city)
        }
        locationManager.stopUpdatingLocation()
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }
    
    private func fetchWeather(city: String) {
        fetchWeatherData(city: city) { forecast, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.contentView.configureCurrentWeatherData(forecast: forecast, forCity: city)
                    self.contentView.configureFutureWeatherData(forecast: forecast)
                } else {
                    print("Temperature not found")
                }
            }
        }
    }
}

// MARK: - UIPickerViewDataSource

//extension ViewController: UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        5
//    }
//}

// MARK: - UIPickerViewDelegate

//extension ViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return contentView.cityOptions[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if self.contentView.cityOptions[row] == "Current location" {
//            getUserLocation()
//        } else {
//            fetchWeather(city: self.contentView.cityOptions[row])
//        }
//    }
//}
