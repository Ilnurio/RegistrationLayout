//
//  BioViewController.swift
//  RegistrationLayout
//
//  Created by Ilnur on 05.04.2023.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet weak var biographyLabel: UILabel!
    
    var biography: String!
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        biographyLabel.text = biography
    }
}

