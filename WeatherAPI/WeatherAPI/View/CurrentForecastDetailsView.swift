//
//  CurrentForecastDetailsView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 3/5/23.
//

import UIKit

class CurrentForecastDetailsView: UIView {
    
    // MARK: - UI Properties
    
    let todayBox: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "BoxBackground")
        box.layer.cornerRadius = 10
        return box
    }()
    
    let currentTempLabel: UILabel = {
        let currentTempLabel = UILabel()
        currentTempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTempLabel.font = .boldSystemFont(ofSize: 28)
        currentTempLabel.textColor = .black
        return currentTempLabel
    }()
    
    let weatherIconImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let conditionsTextLabel: UILabel = {
        let conditionsTextLabel = UILabel()
        conditionsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionsTextLabel.font = .boldSystemFont(ofSize: 16)
        conditionsTextLabel.textColor = .black
        return conditionsTextLabel
    }()
    
    let highTempLabel: UILabel = {
        let highTempLabel = UILabel()
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        highTempLabel.font = .systemFont(ofSize: 18)
        highTempLabel.textColor = .black
        return highTempLabel
    }()
    
    let lowTempLabel: UILabel = {
        let lowTempLabel = UILabel()
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTempLabel.font = .systemFont(ofSize: 18)
        lowTempLabel.textColor = .black
        return lowTempLabel
    }()
    
    let windLabel: UILabel = {
        let windLabel = UILabel()
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.font = .systemFont(ofSize: 18)
        windLabel.textColor = .black
        return windLabel
    }()
    
    let humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.font = .systemFont(ofSize: 18)
        humidityLabel.textColor = .black
        return humidityLabel
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Layout
    
    private func configureViews() {
        addSubview(todayBox)
        addSubview(weatherIconImage)
        addSubview(conditionsTextLabel)
        addSubview(currentTempLabel)
        addSubview(highTempLabel)
        addSubview(lowTempLabel)
        addSubview(windLabel)
        addSubview(humidityLabel)
        
        NSLayoutConstraint.activate([
            todayBox.topAnchor.constraint(equalTo: topAnchor),
            todayBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            todayBox.trailingAnchor.constraint(equalTo: trailingAnchor),
            todayBox.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            currentTempLabel.topAnchor.constraint(equalTo: todayBox.topAnchor, constant: 10),
            currentTempLabel.centerXAnchor.constraint(equalTo: weatherIconImage.centerXAnchor),

            weatherIconImage.topAnchor.constraint(equalTo: currentTempLabel.bottomAnchor, constant: 5),
            weatherIconImage.trailingAnchor.constraint(equalTo: todayBox.centerXAnchor, constant: -50),
//            weatherIconImage.leadingAnchor.constraint(equalTo: todayBox.leadingAnchor, constant: 40),
                        
            conditionsTextLabel.topAnchor.constraint(equalTo: weatherIconImage.bottomAnchor, constant: 5),
            conditionsTextLabel.centerXAnchor.constraint(equalTo: weatherIconImage.centerXAnchor),
            
            highTempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            highTempLabel.leadingAnchor.constraint(equalTo: todayBox.centerXAnchor, constant: 20),
            
            lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor),
            lowTempLabel.leadingAnchor.constraint(equalTo: highTempLabel.leadingAnchor),
            
            windLabel.topAnchor.constraint(equalTo: lowTempLabel.bottomAnchor),
            windLabel.leadingAnchor.constraint(equalTo: highTempLabel.leadingAnchor),
            
            humidityLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: highTempLabel.leadingAnchor),
        ])
    }
}
