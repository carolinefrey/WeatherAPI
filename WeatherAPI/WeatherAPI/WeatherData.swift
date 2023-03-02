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

public func fetchWeatherData(city: String, completion: @escaping (Forecast?, Error?) -> Void) {
    var cityFormatted = ""
    switch city {
    case "Denver":
        cityFormatted = "Denver"
    case "Los Angeles":
        cityFormatted = "Los%20Angeles"
    case "New York":
        cityFormatted = "New%20York"
    case "Boston":
        cityFormatted = "Boston"
    default:
        cityFormatted = "Denver"
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
