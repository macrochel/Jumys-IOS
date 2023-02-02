import UIKit
import FirebaseDatabase
import FirebaseAuth

class registration2: UIViewController {

    @IBOutlet weak var town: UITextField!
    @IBOutlet weak var expirience: UITextField!
    @IBOutlet weak var citizenship: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var birthDay: UITextField!
    @IBOutlet weak var birthDayValue: UIDatePicker!
    @IBOutlet weak var genderValue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        town.borderStyle = UITextField.BorderStyle.roundedRect
        expirience.borderStyle = UITextField.BorderStyle.roundedRect
        citizenship.borderStyle = UITextField.BorderStyle.roundedRect
        gender.borderStyle = UITextField.BorderStyle.roundedRect
        birthDay.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    @IBAction func next(_ sender: Any) {
        if (town.text! != "") || (citizenship.text! != "") || (expirience.text! != ""){
            userDater.town = self.town.text!
            userDater.expirience = self.expirience.text!
            userDater.citizenship = self.citizenship.text!
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            userDater.dateOfBitrh = dateFormatter.string(from: self.birthDayValue.date)
            switch self.genderValue.selectedSegmentIndex{
            case 0:
                userDater.gender = "Мужской"
            case 1:
                userDater.gender = "Женский"
            default:
                print("error")
            }
            if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabController") as? UITabBarController{
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
}
