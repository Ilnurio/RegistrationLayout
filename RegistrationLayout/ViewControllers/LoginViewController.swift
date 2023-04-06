//
//  ViewController.swift
//  registrationLayout
//
//  Created by Ilnur on 02.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userID = User.getUserData()
    
    private let user = "Alexey"
    private let password = "Password"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if viewController is WelcomeViewController {
                userNameTF.text = user
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.text = "Alexey"
        passwordTF.text = "Password"
    }
    
    @IBAction func logInButtonTapped() {
        guard userNameTF.text == user,
              passwordTF.text == password else {
            showAlert(
                title: "Name or password are wrong",
                message: "Please, try again",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegisterDataTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user) 👨🏼‍💻")
        : showAlert(title: "Oops!", message: "Your password is \(password) ⌨️")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - extensionOne - showAllert
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - extensionTwo - touchesBegan
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonTapped()
        }
        return true
    }
}

