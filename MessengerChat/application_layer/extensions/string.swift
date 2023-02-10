//
//  string.swift
//  MessengerChat
//
//  Created by NourAllah Ahmed on 10/02/2023.
//

import Foundation
import UIKit

extension String {
    
    var isEmailFormatted : Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: self)
        
    }
    var isPasswordVaild : Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        
        return passwordPred.evaluate(with: self)
    }
}
