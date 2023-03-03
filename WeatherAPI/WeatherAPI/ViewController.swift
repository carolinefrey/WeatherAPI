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
                    self.configureWeatherIcon(forecast: forecast, city: city)
                    self.contentView.forecastLabel.text = "\(forecast.current.condition.text)"
                    self.contentView.conditionsLabel.text = "Currently \(forecast.current.temp_f)°. High of \(forecast.forecast.forecastday[0].day.maxtemp_f)°. Low of \(forecast.forecast.forecastday[0].day.mintemp_f)°"
                    self.contentView.windLabel.text = "Winds at \(forecast.current.wind_mph) mph"
                    self.contentView.humidityLabel.text = "Humidity of \(forecast.current.humidity)%"
                } else {
                    print("Temperature not found")
                }
            }
        }
    }
    
    private func configureWeatherIcon(forecast: Forecast, city: String) {
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
