//
//  MainContentView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit

class MainContentView: UIView {
    
    // MARK: - UI Properties
    
    let viewTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = ("Forecast")
        title.font = .boldSystemFont(ofSize: 36)
        title.textColor = .black
        return title
    }()

    let todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Today"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    let weatherIconImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let forecastLabel: UILabel = {
        let forecastLabel = UILabel()
        forecastLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastLabel.font = .boldSystemFont(ofSize: 16)
        forecastLabel.textColor = .black
        return forecastLabel
    }()
    
    let conditionsLabel: UILabel = {
        let conditionLabel = UILabel()
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.font = .systemFont(ofSize: 14)
        conditionLabel.textColor = .black
        return conditionLabel
    }()
    
    let windLabel: UILabel = {
        let windLabel = UILabel()
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.font = .systemFont(ofSize: 14)
        windLabel.textColor = .black
        return windLabel
    }()
    
    let humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.font = .systemFont(ofSize: 14)
        humidityLabel.textColor = .black
        return humidityLabel
    }()
    
    let aheadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ahead"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    let aheadBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .lightGray
        box.layer.cornerRadius = 10
        return box
    }()
    
    let oneDayAhead: FutureForecastView = {
        let oneDayAhead = FutureForecastView()
        oneDayAhead.translatesAutoresizingMaskIntoConstraints = false
        return oneDayAhead
    }()
    
    let twoDaysAhead: FutureForecastView = {
        let twoDaysAhead = FutureForecastView()
        twoDaysAhead.translatesAutoresizingMaskIntoConstraints = false
        return twoDaysAhead
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func configureCurrentWeatherData(forecast: Forecast, forCity city: String) {
        forecastLabel.text = "\(forecast.current.condition.text)"
        conditionsLabel.text = "Currently \(forecast.current.temp_f)°. High of \(forecast.forecast.forecastday[0].day.maxtemp_f)°. Low of \(forecast.forecast.forecastday[0].day.mintemp_f)°"
        windLabel.text = "Winds at \(forecast.current.wind_mph) mph"
        humidityLabel.text = "Humidity of \(forecast.current.humidity)%"
        
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        weatherIconImage.image = UIImage(systemName: getWeatherIcon(conditions: forecast.current.condition.text), withConfiguration: config)
    }
    
    func configureFutureWeatherData(forecast: Forecast) {
        oneDayAhead.conditionsLabel.text = "\(forecast.forecast.forecastday[1].day.condition.text)"
        oneDayAhead.highTempLabel.text = "High of \(forecast.forecast.forecastday[1].day.maxtemp_f)°"
        oneDayAhead.lowTempLabel.text = "Low of \(forecast.forecast.forecastday[1].day.mintemp_f)°"
        
        twoDaysAhead.conditionsLabel.text = "\(forecast.forecast.forecastday[2].day.condition.text)"
        twoDaysAhead.highTempLabel.text = "High of \(forecast.forecast.forecastday[2].day.maxtemp_f)°"
        twoDaysAhead.lowTempLabel.text = "Low of \(forecast.forecast.forecastday[2].day.mintemp_f)°"
        
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        oneDayAhead.weatherIcon.image = UIImage(systemName: getWeatherIcon(conditions: forecast.forecast.forecastday[1].day.condition.text), withConfiguration: config)
        twoDaysAhead.weatherIcon.image = UIImage(systemName: getWeatherIcon(conditions: forecast.forecast.forecastday[2].day.condition.text), withConfiguration: config)
    }
    
    func getWeatherIcon(conditions: String) -> String {
        if conditions == "Sunny" || conditions == "Clear" {
            return "sun.max.fill"
        } else if conditions == "Partly cloudy" || conditions == "Overcast" {
            return "cloud.sun"
        } else if conditions == "Cloudy" {
            return "cloud.fill"
        } else if conditions == "Mist" || conditions == "Fog" || conditions == "Freezing fog" {
            return "cloud.fog.fill"
        } else if conditions == "Patchy rain possible" || conditions == "Patchy light rain" || conditions == "Light rain" || conditions == "Patchy light drizzle" || conditions == "Light drizzle" || conditions == "Light rain shower" {
            return "cloud.drizzle.fill"
        } else if conditions == "Moderate rain at times" || conditions == "Moderate rain" || conditions == "Heavy rain at times" || conditions == "Heavy rain" || conditions == "Moderate or heavy rain shower" || conditions == "Torrential rain shower" {
            return "cloud.rain.fill"
        } else if conditions == "Light freezing rain" || conditions == "Moderate or heavy freezing rain" || conditions == "Light sleet" || conditions == "Moderate or heavy sleet" || conditions == "Ice pellets" || conditions == "Freezing drizzle" || conditions == "Heavy freezing drizzle" || conditions == "Light sleet showers" || conditions == "Moderate or heavy sleet showers" || conditions == "Light showers of ice pellets" || conditions == "Moderate or heavy showers of ice pellets" {
            return "cloud.sleet.fill"
        } else if conditions == "Patchy light snow" || conditions == "Light snow" || conditions == "Patchy moderate snow" || conditions == "Moderate snow" || conditions == "Patchy heavy snow" || conditions == "Heavy snow" || conditions == "Light snow showers" || conditions == "Moderate or heavy snow showers" {
            return "cloud.snow.fill"
        } else if conditions == "Patchy light rain with thunder" || conditions == "Moderate or heavy rain with thunder" || conditions == "Patchy light snow with thunder" || conditions == "Moderate or heavy snow with thunder" {
            return "cloud.bolt.rain"
        }
        return ""
    }
    
    // MARK: - UI Setup
    
    private func configureViews() {
        addSubview(viewTitle)
        addSubview(todayLabel)
        addSubview(weatherIconImage)
        addSubview(forecastLabel)
        addSubview(conditionsLabel)
        addSubview(windLabel)
        addSubview(humidityLabel)
        addSubview(aheadLabel)
        addSubview(aheadBox)
        addSubview(oneDayAhead)
        addSubview(twoDaysAhead)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            todayLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 35),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            weatherIconImage.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 15),
            weatherIconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            forecastLabel.topAnchor.constraint(equalTo: weatherIconImage.bottomAnchor, constant: 5),
            forecastLabel.centerXAnchor.constraint(equalTo: weatherIconImage.centerXAnchor),
            
            conditionsLabel.topAnchor.constraint(equalTo: weatherIconImage.topAnchor),
            conditionsLabel.leadingAnchor.constraint(equalTo: weatherIconImage.trailingAnchor, constant: 10),
            
            windLabel.topAnchor.constraint(equalTo: conditionsLabel.bottomAnchor),
            windLabel.leadingAnchor.constraint(equalTo: weatherIconImage.trailingAnchor, constant: 10),
            
            humidityLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: weatherIconImage.trailingAnchor, constant: 10),
            
            aheadLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 100),
            aheadLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            aheadBox.topAnchor.constraint(equalTo: aheadLabel.bottomAnchor, constant: 15),
            aheadBox.centerXAnchor.constraint(equalTo: centerXAnchor),
            aheadBox.heightAnchor.constraint(equalToConstant: 150),
            aheadBox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            
            oneDayAhead.topAnchor.constraint(equalTo: aheadBox.topAnchor, constant: 15),
            oneDayAhead.leadingAnchor.constraint(equalTo: aheadBox.leadingAnchor, constant: 20),
            oneDayAhead.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            twoDaysAhead.topAnchor.constraint(equalTo: aheadBox.topAnchor, constant: 15),
            twoDaysAhead.leadingAnchor.constraint(equalTo: aheadBox.leadingAnchor, constant: 200),
            twoDaysAhead.trailingAnchor.constraint(equalTo: aheadBox.trailingAnchor, constant: -20)
        ])
    }
}

