//
//  MainContentView.swift
//  WeatherAPI
//
//  Created by Caroline Frey on 2/28/23.
//

import UIKit

class MainContentView: UIView {
    
    let cityOptions = ["Denver", "Los Angeles", "New York", "Boston"]

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
    
    let weatherIconImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let temperature: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 24)
        temp.textColor = .black
        return temp
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
        addSubview(cityPicker)
        addSubview(weatherIconImage)
        addSubview(temperature)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cityPicker.topAnchor.constraint(equalTo: viewTitle.bottomAnchor),
            cityPicker.centerXAnchor.constraint(equalTo: centerXAnchor),

            weatherIconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherIconImage.topAnchor.constraint(equalTo: cityPicker.bottomAnchor, constant: 10),
            
            temperature.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperature.topAnchor.constraint(equalTo: weatherIconImage.bottomAnchor, constant: 10)
        ])
    }
}

