import Foundation
import UIKit

class UserData{
    var fio: String
    var email: String
    var phone: String
    var town: String
    var dateOfBitrh: String
    var citizenship: String
    var expirience: String
    var gender: String
    
    init(_ fio:String, _ email:String, _ phone:String, _ town:String, _ dateOfBirth:String, _ citizenship:String, _ expirience:String, _ gender:String){
        self.fio = fio
        self.email = email
        self.phone = phone
        self.town = town
        self.dateOfBitrh = dateOfBirth
        self.citizenship = citizenship
        self.expirience = expirience
        self.gender = gender
    }
    
    init(){
        self.fio = String()
        self.email = String()
        self.phone = String()
        self.town = String()
        self.dateOfBitrh = String()
        self.citizenship = String()
        self.expirience = String()
        self.gender = String()
    }
}
