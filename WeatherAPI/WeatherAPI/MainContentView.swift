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
        title.text = ("Today's Weather")
        title.font = .boldSystemFont(ofSize: 36)
        title.textColor = .black
        return title
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
        
        configureWeatherIcon(withIcon: "sun.max.fill")
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func configureWeatherIcon(withIcon icon: String) {
        let config = UIImage.SymbolConfiguration.preferringMulticolor()
        weatherIconImage.image = UIImage(systemName: icon, withConfiguration: config)
    }
    
    // MARK: - UI Setup
    
    private func configureViews() {
        addSubview(viewTitle)
        addSubview(weatherIconImage)
        addSubview(temperature)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor),

            weatherIconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherIconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImage.heightAnchor.constraint(equalToConstant: 100),
            weatherIconImage.widthAnchor.constraint(equalToConstant: 100),
            
            temperature.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperature.topAnchor.constraint(equalTo: weatherIconImage.bottomAnchor, constant: 20)
        ])
    }
}

