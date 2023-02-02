import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebasePerformance
import SwiftUI

var userDater = UserData()

class ViewController: UIViewController {

    @IBOutlet weak var checkBoxValue: UIButton!
    @IBOutlet weak var registrationHeader: UILabel!
    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var passwordConfirmation: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorField: UITextView!
    
    var Ischeck: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fio.borderStyle = UITextField.BorderStyle.roundedRect
        email.borderStyle = UITextField.BorderStyle.roundedRect
        phone.borderStyle = UITextField.BorderStyle.roundedRect
        passwordConfirmation.borderStyle = UITextField.BorderStyle.roundedRect
        password.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    @IBAction func checkBox(_ sender: Any) {
        if !Ischeck{
            checkBoxValue.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            Ischeck = true
        }
        else{
            checkBoxValue.setImage(UIImage(systemName: "square"), for: .normal)
            Ischeck = false
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if (password.text! == passwordConfirmation.text!){
            if (Ischeck){
                Auth.auth().createUser(withEmail: email.text!, password: password.text!)
                { authResult, error in
                    if (error == nil){
                        userDater.fio = self.fio.text!
                        userDater.phone = self.phone.text!
                        userDater.email = self.email.text!
                        if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "registration2") as? registration2{
                            newViewController.modalPresentationStyle = .fullScreen
                            self.present(newViewController, animated: true, completion: nil)
                            
                        }
                    }
                    
                    else{
                        self.errorField.isHidden = false
                        self.errorField.text = "Пороль должен состоянить, минимум из 6 символов"
                    }
                }
            }
            
            else{
                self.errorField.isHidden = false
                self.errorField.text = "Вы должны согласиться с условиями пользования"
            }
            
        }
        
        else{
            self.errorField.isHidden = false
            self.errorField.text = "Пороли должны совпадать!"
        }
    }
    
}
