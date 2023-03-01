//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import Foundation
import UIKit

public struct Properties: Codable {
    let City: String
    let State: String
    let TempF: String
    let TempC: String
    let Weather: String
}

public func fetchWeatherData(city: String, completion: @escaping (Properties?, Error?) -> Void) {
    var state = "CO"
    var cityFormatted = "Denver"
    switch city {
    case "Denver":
        cityFormatted = "Denver"
        state = "CO"
    case "Los Angeles":
        cityFormatted = "Los%20Angeles"
        state = "CA"
    case "New York":
        cityFormatted = "New%20York"
        state = "NY"
    case "Boston":
        cityFormatted = "Boston"
        state = "MA"
    default:
        state = "CO"
    }
    guard let weatherURL = URL(string: "https://us-weather-by-city.p.rapidapi.com/getweather?city=\(cityFormatted)&state=\(state)") else {
        print("Invalid URL")
        return
    }
    
    var urlRequest = URLRequest(url: weatherURL)
    urlRequest.httpMethod = "GET"
    
    let headers = [
        "X-RapidAPI-Key": APIConstants.key,
        "X-RapidAPI-Host": "us-weather-by-city.p.rapidapi.com"
    ]
    
    urlRequest.allHTTPHeaderFields = headers
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let weatherData = try JSONDecoder().decode(Properties.self, from: data)
            print(weatherData)
            completion(weatherData, nil)
        } catch {
            completion(nil, error)
            print("\(error.localizedDescription)")
        }
    }.resume()
}
