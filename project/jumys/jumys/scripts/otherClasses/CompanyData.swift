import Foundation
import UIKit

class CompanyData{
    var cost:String
    var place:String
    var name:String
    var needs:String
    
    init(_ cost:String, _ place:String, _ name:String, _ needs:String){
        self.cost = cost
        self.place = place
        self.name = name
        self.needs = needs
    }
    
    init(){
        self.cost = String()
        self.place = String()
        self.name = String()
        self.needs = String()
    }
}
