import UIKit
import FirebaseAuth

class auth: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.borderStyle = UITextField.BorderStyle.roundedRect
        password.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    @IBAction func auth(_ sender: Any) {
        self.errorField.isHidden = false
        self.errorField.textColor = .green
        self.errorField.text = "Вход в аккаунт подождите"
        let jeremyGif = UIImage.gifImageWithName("loading")
        let imageView1 = UIImageView(image: jeremyGif)
        imageView.isHidden = false
        imageView.addSubview(imageView1)
        Auth.auth().signIn(withEmail: email.text!, password: password.text!)
        { authResult, error in
            if (error == nil) {
                if let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabController") as? UITabBarController{
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
                }
            }

            else{
                self.imageView.isHidden = true
                self.errorField.isHidden = false
                self.errorField.textColor = .red
                self.errorField.text = "Неверный логин или пороль"
            }

        }
    }
}
