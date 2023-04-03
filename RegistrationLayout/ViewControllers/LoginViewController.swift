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
    
    private let user = "Alexey"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = user
    }

    @IBAction func logInButtonTapped() {
        guard let userName = userNameTF.text,
              let password = passwordTF.text else { return }
        if userName != user || password != password {
                showAlert(
                    tittle: "Name or password are wrong",
                    message: "Please, try again"
                )
            }
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    // сделать тернарный оператор из видео
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        showAlert(tittle: "Oops!", message: "Your name is \(user) 👨🏼‍💻")
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(tittle: "Oops!", message: "Your password is \(password) ⌨️")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - extensionOne - showAllert
extension LoginViewController {
    private func showAlert(tittle: String, message: String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
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

