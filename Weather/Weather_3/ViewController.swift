
import UIKit

class ViewController: UIViewController, UITextFieldDelegate
    
    //MARK: Properties
    
{
 
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var getCityWeatherButton: UIButton!
    
    var weather: WeatherGetter!
    
    

    @IBOutlet weak var munich: UILabel!
    
    
    @IBAction func WeatherButton(_ sender: Any) {
        print(weather)
        //let temp = (data["main"]!["temp"]!!)
        //print(temp)
        //munich.text = temp as? String

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter()
        weather.getWeather(city: "Muenchen")
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
