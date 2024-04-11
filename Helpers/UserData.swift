//
//  UserData.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//

import Foundation

protocol UserDataProtocol {
    var email: String? { get set }
    var password: String? { get set }
    var birthday: String? { get set }
    var name: String? { get set }
}

struct UserData {
    var email: String?
    var password: String?
    var birthday: String? = ""
    var name: String? = ""
}
