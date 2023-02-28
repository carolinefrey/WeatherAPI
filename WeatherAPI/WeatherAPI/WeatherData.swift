//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import Foundation
import UIKit

public struct Forecast: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: Currently
}

public struct Currently: Codable {
    let summary: String
    let temperature: Double
}

public func fetchWeatherData(completion: @escaping (Forecast?, Error?) -> Void) {
    guard let weatherURL = URL(string: "https://dark-sky.p.rapidapi.com/39.751710,-105.004230?units=auto&lang=en") else {
        print("Invalid URL")
        return
    }
    
    var urlRequest = URLRequest(url: weatherURL)
    urlRequest.httpMethod = "GET"
    
    let headers = [
        "X-RapidAPI-Key": APIConstants.key,
        "X-RapidAPI-Host": "dark-sky.p.rapidapi.com"
    ]
    
    urlRequest.allHTTPHeaderFields = headers
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let weatherData = try JSONDecoder().decode(Forecast.self, from: data)
            completion(weatherData, nil)
        } catch {
            completion(nil, error)
            print("\(error.localizedDescription)")
        }
    }.resume()
}
