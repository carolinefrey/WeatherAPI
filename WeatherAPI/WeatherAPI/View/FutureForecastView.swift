//
//  FutureForecastView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 3/5/23.
//

import UIKit

class FutureForecastView: UIView {
        
    // MARK: - UI Properties
    
    let weatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let conditionsLabel: UILabel = {
        let conditionLabel = UILabel()
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.font = .systemFont(ofSize: 14)
        conditionLabel.textColor = .black
        return conditionLabel
    }()
    
    let highTempLabel: UILabel = {
        let highTempLabel = UILabel()
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        highTempLabel.font = .systemFont(ofSize: 14)
        return highTempLabel
    }()
    
    let lowTempLabel: UILabel = {
        let lowTempLabel = UILabel()
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTempLabel.font = .systemFont(ofSize: 14)
        return lowTempLabel
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
        addSubview(weatherIcon)
        addSubview(conditionsLabel)
        addSubview(highTempLabel)
        addSubview(lowTempLabel)
        
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: topAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            conditionsLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor),
            conditionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            highTempLabel.topAnchor.constraint(equalTo: conditionsLabel.bottomAnchor),
            highTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor),
            lowTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
