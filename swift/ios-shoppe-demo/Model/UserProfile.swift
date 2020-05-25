//
//  UserProfile.swift
//  ios-shoppe-demo
//
//  Created on 4/30/20.
//  Copyright © 2020 Harold Davis Jr. All rights reserved.
//

import Foundation

class UserProfile {
    var name: String
    var street: String
    var phone: String
    var email: String


    init(addressDetail: [AddressDetail: String]) {
        self.name = addressDetail[.name] ?? ""
        self.street = addressDetail[.street] ?? ""
        self.phone = addressDetail[.phone] ?? ""
        self.email = addressDetail[.email] ?? ""
    }

    func description() -> String {
        return "\(name)/n\(street)/n\(phone)"
    }

    func dictDescription() -> [String: Any] {
        return ["Name" : name, "email": email]
    }
}
