import UIKit

class ProfileView: UIViewController {

    @IBOutlet weak var birthDay: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var citizenship: UITextField!
    @IBOutlet weak var expirience: UITextField!
    @IBOutlet weak var fio: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDay.borderStyle = UITextField.BorderStyle.roundedRect
        gender.borderStyle = UITextField.BorderStyle.roundedRect
        email.borderStyle = UITextField.BorderStyle.roundedRect
        citizenship.borderStyle = UITextField.BorderStyle.roundedRect
        expirience.borderStyle = UITextField.BorderStyle.roundedRect
        birthDay.text = userDater.dateOfBitrh
        gender.text = userDater.gender
        email.text = userDater.email
        citizenship.text = userDater.citizenship
        expirience.text = userDater.expirience
        fio.text = userDater.fio
        
    }
}
