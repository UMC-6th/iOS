//
//  SecondViewController.swift
//  Week5
//
//  Created by 김승원 on 5/11/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Variables
    var weather: Weather?
    var main: Main?
    var name: String?
    
    
    
    
    // MARK: - UI Components
    private let cityLabel: UILabel = {
        let lb = UILabel()
        lb.text = "도시"
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        lb.textColor = .label
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let lb1: UILabel = {
        let lb = UILabel()
        lb.text = "현재 온도"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lb.textColor = .label
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let lb2: UILabel = {
        let lb = UILabel()
        lb.text = "최고 온도"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lb.textColor = .label
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let lb3: UILabel = {
        let lb = UILabel()
        lb.text = "최저 온도"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lb.textColor = .label
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let weatherButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("날씨 불러오기", for: .normal)
        btn.configuration = .filled()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let weatherImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "errorImage")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        weatherButton.addTarget(self, action: #selector(didTapWeatherButton), for: .touchUpInside)
        
    }
    
    // MARK: - UI Set up
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(cityLabel)
        
        stackView.addArrangedSubview(lb1)
        stackView.addArrangedSubview(lb2)
        stackView.addArrangedSubview(lb3)
        
        self.view.addSubview(stackView)
        
        self.view.addSubview(weatherButton)
        self.view.addSubview(weatherImageView)
        
        setupConstraints()
    }
    
    // MARK: - Constraints Set up
    
    private func setupConstraints() {
        cityLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        weatherButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -50).isActive = true
        weatherButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        weatherButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        weatherButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        weatherImageView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20).isActive = true
        weatherImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        weatherImageView.heightAnchor.constraint(equalTo: self.weatherImageView.widthAnchor, multiplier: 1.0).isActive = true
        
    }
    
    // MARK: - Selectors
    
    @objc private func didTapWeatherButton() {
        print("Weather Button Tapped")
        
        // data Fetch
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    
                    if let icon = self.weather?.icon {
                        let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                        if let url = URL(string: urlString) {
                            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                                if let error = error {
                                    print("Error: \(error)")
                                    return
                                }
                                
                                guard let data = data else {
                                    print("No data received")
                                    return
                                }
                                
                                DispatchQueue.main.async {
                                    self.weatherImageView.image = UIImage(data: data)
                                }
                            }
                            
                            task.resume()
                        } else {
                            print("Invalid URL")
                        }
                    } else {
                        print("No icon provided")
                    }
                    
                    self.lb1.text = "현재 온도 : \(Int(self.main!.temp - 273))"
                    self.lb2.text = "최고 온도 : \(Int(self.main!.temp_min - 273))"
                    self.lb3.text = "최저 온도 : \(Int(self.main!.temp_max - 273))"
                    self.cityLabel.text = "\(self.name!)"
                    
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    
}
