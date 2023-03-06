//
//  FutureForecastView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 3/5/23.
//

import UIKit

class FutureForecastView: UIView {
        
    // MARK: - UI Properties

    let boxView: UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = UIColor(named: "BoxBackground")
        box.layer.cornerRadius = 10
        return box
    }()
    
    let weatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let conditionsLabel: UILabel = {
        let conditionLabel = UILabel()
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.font = .boldSystemFont(ofSize: 16)
        conditionLabel.textColor = .black
        conditionLabel.adjustsFontSizeToFitWidth = true
        return conditionLabel
    }()
    
    let highTempLabel: UILabel = {
        let highTempLabel = UILabel()
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        highTempLabel.font = .systemFont(ofSize: 14)
        highTempLabel.textColor = .black
        return highTempLabel
    }()
    
    let lowTempLabel: UILabel = {
        let lowTempLabel = UILabel()
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTempLabel.font = .systemFont(ofSize: 14)
        lowTempLabel.textColor = .black
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
        addSubview(boxView)
        addSubview(weatherIcon)
        addSubview(conditionsLabel)
        addSubview(highTempLabel)
        addSubview(lowTempLabel)
        
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: topAnchor),
            boxView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boxView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boxView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            weatherIcon.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 5),
            weatherIcon.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            
            conditionsLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 15),
            conditionsLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            
            highTempLabel.topAnchor.constraint(equalTo: conditionsLabel.bottomAnchor),
            highTempLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            
            lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor),
            lowTempLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
        ])
    }
}
