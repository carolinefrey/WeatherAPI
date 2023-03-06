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
    
    let currentForecastDetails: CurrentForecastDetailsView = {
        let details = CurrentForecastDetailsView()
        details.translatesAutoresizingMaskIntoConstraints = false
        return details
    }()
    
    let aheadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ahead"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    let oneDayAheadForecast: FutureForecastView = {
        let oneDayAhead = FutureForecastView()
        oneDayAhead.translatesAutoresizingMaskIntoConstraints = false
        return oneDayAhead
    }()
    
    let tomorrowLabel: UILabel = {
        let tomorrowLabel = UILabel()
        tomorrowLabel.translatesAutoresizingMaskIntoConstraints = false
        tomorrowLabel.font = .boldSystemFont(ofSize: 20)
        tomorrowLabel.textColor = .black
        tomorrowLabel.text = "Tomorrow"
        return tomorrowLabel
    }()
    
    let twoDaysAheadForecast: FutureForecastView = {
        let twoDaysAhead = FutureForecastView()
        twoDaysAhead.translatesAutoresizingMaskIntoConstraints = false
        return twoDaysAhead
    }()
    
    let futureDateLabel: UILabel = {
        let futureDateLabel = UILabel()
        futureDateLabel.translatesAutoresizingMaskIntoConstraints = false
        futureDateLabel.font = .boldSystemFont(ofSize: 20)
        futureDateLabel.textColor = .black
        return futureDateLabel
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
    
    func configureCurrentWeatherData(forecast: Forecast) {
        currentForecastDetails.conditionsTextLabel.text = "\(forecast.current.condition.text)"
        currentForecastDetails.currentTempLabel.text = "\(forecast.current.temp_f)°"
        currentForecastDetails.highTempLabel.text = "High of \(String(format: "%.0f", forecast.forecast.forecastday[0].day.maxtemp_f))°"
        currentForecastDetails.lowTempLabel.text = "Low of \(String(format: "%.0f", forecast.forecast.forecastday[0].day.mintemp_f))°"
        currentForecastDetails.windLabel.text = "Winds at \(String(format: "%.0f", forecast.current.wind_mph)) mph"
        currentForecastDetails.humidityLabel.text = "Humidity of \(String(format: "%.0f", forecast.current.humidity))%"
        
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        currentForecastDetails.weatherIconImage.image = UIImage(systemName: getWeatherIcon(conditions: forecast.current.condition.text), withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
    }
    
    func configureFutureWeatherData(forecast: Forecast) {
        oneDayAheadForecast.conditionsLabel.text = "\(forecast.forecast.forecastday[1].day.condition.text)"
        oneDayAheadForecast.highTempLabel.text = "High of \(String(format: "%.0f", forecast.forecast.forecastday[1].day.maxtemp_f))°"
        oneDayAheadForecast.lowTempLabel.text = "Low of \(String(format: "%.0f", forecast.forecast.forecastday[1].day.mintemp_f))°"
        
        twoDaysAheadForecast.conditionsLabel.text = "\(forecast.forecast.forecastday[2].day.condition.text)"
        twoDaysAheadForecast.highTempLabel.text = "High of \(String(format: "%.0f", forecast.forecast.forecastday[2].day.maxtemp_f))°"
        twoDaysAheadForecast.lowTempLabel.text = "Low of \(String(format: "%.0f", forecast.forecast.forecastday[2].day.mintemp_f))°"
        
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        oneDayAheadForecast.weatherIcon.image = UIImage(systemName: getWeatherIcon(conditions: forecast.forecast.forecastday[1].day.condition.text), withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        twoDaysAheadForecast.weatherIcon.image = UIImage(systemName: getWeatherIcon(conditions: forecast.forecast.forecastday[2].day.condition.text), withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        
        let dateString = "\(forecast.forecast.forecastday[2].date)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        if let date = dateFormatter.date(from: dateString) {
            let dateFormatted = date.displayFormat
            futureDateLabel.text = "\(dateFormatted)"
        }
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
        addSubview(currentForecastDetails)
        addSubview(aheadLabel)
        addSubview(oneDayAheadForecast)
        addSubview(tomorrowLabel)
        addSubview(twoDaysAheadForecast)
        addSubview(futureDateLabel)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            todayLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 35),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            currentForecastDetails.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 15),
            currentForecastDetails.centerXAnchor.constraint(equalTo: centerXAnchor),
            currentForecastDetails.heightAnchor.constraint(equalToConstant: 150),
            currentForecastDetails.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
//            currentForecastDetails.leadingAnchor.constraint(equalTo: todayBox.leadingAnchor, constant: 20),
            
            aheadLabel.topAnchor.constraint(equalTo: currentForecastDetails.bottomAnchor, constant: 50),
            aheadLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            oneDayAheadForecast.topAnchor.constraint(equalTo: aheadLabel.bottomAnchor, constant: 15),
            oneDayAheadForecast.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            oneDayAheadForecast.heightAnchor.constraint(equalToConstant: 150),
            oneDayAheadForecast.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.43),
            
            tomorrowLabel.topAnchor.constraint(equalTo: oneDayAheadForecast.bottomAnchor, constant: 5),
            tomorrowLabel.centerXAnchor.constraint(equalTo: oneDayAheadForecast.centerXAnchor),
            
            twoDaysAheadForecast.topAnchor.constraint(equalTo: aheadLabel.bottomAnchor, constant: 15),
            twoDaysAheadForecast.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            twoDaysAheadForecast.heightAnchor.constraint(equalToConstant: 150),
            twoDaysAheadForecast.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.43),
            
            futureDateLabel.topAnchor.constraint(equalTo: twoDaysAheadForecast.bottomAnchor, constant: 5),
            futureDateLabel.centerXAnchor.constraint(equalTo: twoDaysAheadForecast.centerXAnchor),
        ])
    }
}

extension Date {
    var displayFormat: String {
        self.formatted(.dateTime.month(.defaultDigits).day(.twoDigits))
    }
}
