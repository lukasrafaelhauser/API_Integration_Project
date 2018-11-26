//
//  Weather_3.swift
//  Weather_3
//
//  Created by Lukas Hauser on 24.11.18.
//  Copyright © 2018 Lukas Hauser. All rights reserved.
//

import Foundation

protocol WeatherGetterDe {
    func didGetWeather(weather: Weather)
    func didNotGetWeather(error: NSError)
}

class WeatherGetter {
    
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "ad8b657d189c616765c6c13be7037a59"
    
    func getWeather(city: String) {
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = NSURL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL as URL) {
            (data, response, error) -> Void in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                do {
                    // Try to convert that data into a Swift dictionary
                    let weather = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    
                    // If we made it to this point, we've successfully converted the
                    // JSON-formatted weather data into a Swift dictionary.
                    // Let's print its contents to the debug console.
                    print("Date and time: \(weather["dt"]!)")
                    print("City: \(weather["name"]!)")
                    
                    print("Longitude: \(weather["coord"]!["lon"]!!)")
                    print("Latitude: \(weather["coord"]!["lat"]!!)")
                    
                    print("Temperature: \(weather["main"]!["temp"]!!)")
                    print("Humidity: \(weather["main"]!["humidity"]!!)")
                    print("Pressure: \(weather["main"]!["pressure"]!!)")
                    
                    print("Cloud cover: \(weather["clouds"]!["all"]!!)")
                    
                    print("Wind speed: \(weather["wind"]!["speed"]!!)")
                    
                    print("Country: \(weather["sys"]!["country"]!!)")
                    print("Sunrise: \(weather["sys"]!["sunrise"]!!)")
                    print("Sunset: \(weather["sys"]!["sunset"]!!)")
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("JSON error description: \(jsonError.description)")
                }
            }
        }
        
        dataTask.resume()
    }
    
}
