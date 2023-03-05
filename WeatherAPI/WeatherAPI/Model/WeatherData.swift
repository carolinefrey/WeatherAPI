//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import Foundation
import UIKit

public struct Forecast: Codable {
    let location: Location
    let current: Current
    let forecast: FullForecast
}

public struct Location: Codable {
    let name: String
    let region: String
    let country: String
}

public struct Current: Codable {
    let temp_f: Double
    let condition: Condition
    let wind_mph: Double
    let humidity: Double
    let cloud: Double
    let feelslike_f: Double
}

public struct Condition: Codable {
    let text: String
}

public struct FullForecast: Codable {
    let forecastday: [ForecastDay]
}

public struct ForecastDay: Codable {
    let day: Day
}

public struct Day: Codable {
    let maxtemp_f: Double
    let mintemp_f: Double
    let condition: Condition
}

public func fetchWeatherData(city: String, completion: @escaping (Forecast?, Error?) -> Void) {
    var cityFormatted = ""
    if city.contains(" ") {
        cityFormatted = city.replacingOccurrences(of: " ", with: "%20")
    } else {
        cityFormatted = city
    }
    guard let weatherURL = URL(string: "https://weatherapi-com.p.rapidapi.com/forecast.json?q=\(cityFormatted)&days=3") else {
        print("Invalid URL")
        return
    }
    
    var urlRequest = URLRequest(url: weatherURL)
    urlRequest.httpMethod = "GET"
    
    let headers = [
        "X-RapidAPI-Key": APIConstants.key,
        "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com"
    ]
    
    urlRequest.allHTTPHeaderFields = headers
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let weatherData = try JSONDecoder().decode(Forecast.self, from: data)
            print(weatherData)
            completion(weatherData, nil)
        } catch {
            completion(nil, error)
            print("\(error.localizedDescription)")
        }
    }.resume()
}
