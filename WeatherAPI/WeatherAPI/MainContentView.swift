//
//  MainContentView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit

class MainContentView: UIView {
    
//    let cityOptions = ["Current location", "Denver", "Los Angeles", "New York", "Boston"]

    // MARK: - UI Properties
    
    let viewTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = ("Forecast")
        title.font = .boldSystemFont(ofSize: 36)
        title.textColor = .black
        return title
    }()

//    let cityPicker: UIPickerView = {
//        let picker = UIPickerView()
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
    
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
    
    func configureWeatherData(forCity city: String, withIcon icon: String) {
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        weatherIconImage.image = UIImage(systemName: icon, withConfiguration: config)
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
        ])
    }
}

