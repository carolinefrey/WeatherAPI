//
//  MainContentView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit

class MainContentView: UIView {
    
    let cityOptions = ["Current location", "Denver", "Los Angeles", "New York", "Boston"]

    // MARK: - UI Properties
    
    let viewTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = ("Today's Weather")
        title.font = .boldSystemFont(ofSize: 36)
        title.textColor = .black
        return title
    }()

    let cityPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    let weatherIconImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let conditionLabel: UILabel = {
        let conditionLabel = UILabel()
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.font = .boldSystemFont(ofSize: 18)
        conditionLabel.textColor = .black
        conditionLabel.text = "Conditions: "
        return conditionLabel
    }()
    
    let conditionData: UILabel = {
        let conditionData = UILabel()
        conditionData.translatesAutoresizingMaskIntoConstraints = false
        conditionData.font = .systemFont(ofSize: 18)
        conditionData.textColor = .black
        return conditionData
    }()
    
    let temperatureLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = .boldSystemFont(ofSize: 18)
        tempLabel.textColor = .black
        tempLabel.text = "Current temperature: "
        return tempLabel
    }()
    
    let temperatureDataLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 18)
        temp.textColor = .black
        return temp
    }()
    
    let windLabel: UILabel = {
        let windLabel = UILabel()
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.font = .boldSystemFont(ofSize: 18)
        windLabel.textColor = .black
        windLabel.text = "Wind speed: "
        return windLabel
    }()
    
    let windDataLabel: UILabel = {
        let windData = UILabel()
        windData.translatesAutoresizingMaskIntoConstraints = false
        windData.font = .systemFont(ofSize: 18)
        windData.textColor = .black
        return windData
    }()
    
    let humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.font = .boldSystemFont(ofSize: 18)
        humidityLabel.textColor = .black
        humidityLabel.text = "Humidity: "
        return humidityLabel
    }()
    
    let humidityDataLabel: UILabel = {
        let humidityData = UILabel()
        humidityData.translatesAutoresizingMaskIntoConstraints = false
        humidityData.font = .systemFont(ofSize: 18)
        humidityData.textColor = .black
        return humidityData
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
        let config = UIImage.SymbolConfiguration(pointSize: 100)
        weatherIconImage.image = UIImage(systemName: icon, withConfiguration: config)
    }
    
    // MARK: - UI Setup
    
    private func configureViews() {
        addSubview(viewTitle)
        addSubview(cityLabel)
        addSubview(weatherIconImage)
        addSubview(conditionLabel)
        addSubview(conditionData)
        addSubview(temperatureLabel)
        addSubview(temperatureDataLabel)
        addSubview(windLabel)
        addSubview(windDataLabel)
        addSubview(humidityLabel)
        addSubview(humidityDataLabel)
        addSubview(cityPicker)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 35),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            weatherIconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherIconImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 15),
            
            conditionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            conditionLabel.topAnchor.constraint(equalTo: weatherIconImage.bottomAnchor, constant: 15),
            conditionData.leadingAnchor.constraint(equalTo: conditionLabel.trailingAnchor),
            conditionData.topAnchor.constraint(equalTo: conditionLabel.topAnchor),
            
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            temperatureLabel.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor),
            temperatureDataLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor),
            temperatureDataLabel.topAnchor.constraint(equalTo: temperatureLabel.topAnchor),
            
            windLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            windLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            windDataLabel.leadingAnchor.constraint(equalTo: windLabel.trailingAnchor),
            windDataLabel.topAnchor.constraint(equalTo: windLabel.topAnchor),
            
            humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            humidityLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor),
            humidityDataLabel.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor),
            humidityDataLabel.topAnchor.constraint(equalTo: humidityLabel.topAnchor),
            
            cityPicker.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 20),
            cityPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

