//
//  UserViewController.swift
//  RegistrationLayout
//
//  Created by Ilnur on 05.04.2023.
//

import UIKit

final class UserViewController: UIViewController {

    @IBOutlet weak var nameSurNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    var nameSurName: String!
    var company: String!
    var position: String!
    var department: String!
    
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
    
    private let bioInfo = User.getUserData().person.aboutMe
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.biography = bioInfo
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        nameSurNameLabel.text = nameSurName
        companyLabel.text = company
        positionLabel.text = position
        departmentLabel.text = department
    }
}
