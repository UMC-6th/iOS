import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let apiKey = "834c739adbc39a057dd4586e384700e7"
    
    
    @IBOutlet weak var pos: UILabel!
    

    
    @IBOutlet weak var lati: UILabel!
    
    @IBOutlet weak var long: UILabel!
    
    @IBOutlet weak var degreeNow: UILabel!
    
    @IBOutlet weak var degreeHigh: UILabel!
    
    @IBOutlet weak var degreeLow: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            fetchWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }

    func fetchWeatherData(lat: Double, lon: Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            if let weatherResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
                DispatchQueue.main.async {
                    self.printWeatherData(weatherResponse)
                }
            }
        }.resume()
    }

    func printWeatherData(_ weatherData: Welcome) {
        print("API - Welcome")
        print("- coord: lon \(weatherData.coord.lon), lat \(weatherData.coord.lat)")
        long.text = String(weatherData.coord.lon)
        lati.text = String(weatherData.coord.lat)
        print("- weather: [")
        for weather in weatherData.weather {
            print("   { id: \(weather.id), main: \(weather.main), description: \(weather.description), icon: \(weather.icon) }")
        }
       
        
        
        print("]")
        print("- base: \(weatherData.base)")
        print("- main: { temp: \(weatherData.main.temp), feelsLike: \(weatherData.main.feelsLike), tempMin: \(weatherData.main.tempMin), tempMax: \(weatherData.main.tempMax), pressure: \(weatherData.main.pressure), humidity: \(weatherData.main.humidity) }")
        degreeLow.text = String(weatherData.main.tempMin)
        degreeHigh.text = String(weatherData.main.tempMax)
        degreeNow.text = String(weatherData.main.temp)
        
        print("- visibility: \(weatherData.visibility)")
        print("- wind: { speed: \(weatherData.wind.speed), deg: \(weatherData.wind.deg) }")
        print("- clouds: { all: \(weatherData.clouds.all) }")
        print("- dt: \(weatherData.dt)")
        print("- sys: { type: \(weatherData.sys.type), id: \(weatherData.sys.id), country: \(weatherData.sys.country), sunrise: \(weatherData.sys.sunrise), sunset: \(weatherData.sys.sunset) }")
        print("- timezone: \(weatherData.timezone)")
        print("- id: \(weatherData.id)")
        print("- name: \(weatherData.name)")
        print("- cod: \(weatherData.cod)")
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
