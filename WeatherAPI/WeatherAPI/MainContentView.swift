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
    
    let weatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
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
        var config = UIImage.SymbolConfiguration.preferringMulticolor()
        weatherIcon.image = UIImage(systemName: icon, withConfiguration: config)
    }
    
    // MARK: - UI Setup
    
    private func configureViews() {
        addSubview(viewTitle)
        addSubview(weatherIcon)
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor),

            weatherIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100),
            weatherIcon.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

