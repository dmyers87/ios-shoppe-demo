//
//  AddressDetail.swift
//  ios-shoppe-demo
//
//  Created on 4/10/20.
//  Copyright © 2020 FullStory All rights reserved.
//

import Foundation

enum AddressDetail {
    case name, street, unit, city, state, zip, phone, email

    var placeHolder: String {
        switch self {
        case .name:
            return "Name"
        case .email:
            return "Password"
        case .street:
            return "Street address or P.O.Box"
        case .unit:
            return "Apt, Suit, Unit, Building (optional)"
        case .city:
            return "City"
        case .state:
            return "State/Province/Region"
        case .zip:
            return "ZIP"
        case .phone:
            return "Phone"
        }
    }

    var template: String {
        switch self {
        case .name:
            return "John Doe"
        case .email:
            return "John_Doe@fullstory.com"
        case .street:
            return "1110 Downing Street"
        case .unit:
            return "Apt, Suit, Unit, Building (optional)"
        case .city:
            return "London"
        case .state:
            return "GG"
        case .zip:
            return "8966"
        case .phone:
            return "115-551-1555"
        }
    }
}
