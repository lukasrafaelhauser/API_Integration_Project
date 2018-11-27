
import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    

    @IBOutlet weak var munich: UILabel!
    
    
    @IBAction func WeatherButton(_ sender: Any) {
         munich.text = "5000 Degrees!"

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
