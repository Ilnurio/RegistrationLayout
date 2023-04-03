//
//  SecondViewController.swift
//  registrationLayout
//
//  Created by Ilnur on 02.04.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
    }
}
