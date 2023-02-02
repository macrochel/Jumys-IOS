import UIKit

class RibonDetail: UIViewController {

    
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var result: UILabel!
    
    var ex = CompanyData()
    override func viewDidLoad() {
        super.viewDidLoad()
        place.text = ex.place
        companyName.text = ex.name
        cost.text = ex.cost + " до вычета налогов"
        detail.text = ex.needs
        
    }
    
    @IBAction func send(_ sender: Any) {
        result.isHidden = false
    }
}
