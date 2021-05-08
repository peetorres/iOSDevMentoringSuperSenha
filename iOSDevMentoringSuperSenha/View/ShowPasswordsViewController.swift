//
//  ViewController.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import UIKit

class ShowPasswordsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var passwordsTextView: UITextView!
    
    var coordinator: MainCoordinator?
    var passwordGeneratorViewModel: PasswordGeneratorViewModel?
    var numberPasswords: Int?
    var rules: RulesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        generatePassword()
    }
    
    func setupNavigationBar() {
//        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Gerador de senhas", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor(red: 155/255.0, green: 36/255.0, blue: 101/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 238/255.0, green: 179/255.0, blue: 217/255.0, alpha: 1)
    }

    @IBAction func generatePasswordAgainTapped(_ sender: UIButton) {
        generatePassword()
    }
    
    @IBAction func showSafetyTips(_ sender: UIButton) {
        coordinator?.showSafetyTips()
    }
    
    func generatePassword() {
        guard let numberPasswords = numberPasswords,
              let rules = rules else { return }
        var passwords = [String]()
        while passwords.count < numberPasswords {
            if let password = passwordGeneratorViewModel?.generatePassword(dto: rules){
                passwords.append(password)
            }
        }
        showPasswords(passwords)
    }
    
    func showPasswords(_ passwords: [String]) {
        passwordsTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        passwordsTextView.text = ""
        for password in passwords {
            passwordsTextView.text.append(password + "\n\n")
        }
    }
}

