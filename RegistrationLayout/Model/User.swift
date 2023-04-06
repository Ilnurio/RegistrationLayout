//
//  User.swift
//  RegistrationLayout
//
//  Created by Ilnur on 05.04.2023.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "Alexey",
            password: "Password",
            person: Person(
                nameAndSurname: "Ilnur Fattakhov",
                company: "KAMSS",
                position: "Certification",
                department: "Development",
                aboutMe: "I'm 27 years old, want to be a programmer!"
            )
        )
    }
}

struct Person {
    let nameAndSurname: String
    let company: String
    let position: String
    let department: String
    let aboutMe: String
}
