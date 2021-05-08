//
//  PasswordGeneratorViewController.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import UIKit

class PasswordGeneratorViewModel {
    
}

class PasswordGeneratorViewController: UIViewController, Storyboarded {
    @IBOutlet weak var numberPasswordsTextField: UITextField!
    @IBOutlet weak var passwordLengthTextField: UITextField!
    @IBOutlet weak var useSmallLettersSwitch: UISwitch!
    @IBOutlet weak var useCapitalLettersSwitch: UISwitch!
    @IBOutlet weak var useDigitsSwitch: UISwitch!
    @IBOutlet weak var useSpecialCharactersSwitch: UISwitch!
    
    var coordinator: MainCoordinator?
    
    var numberPassword: Int? {
        guard let numberPasswords = numberPasswordsTextField.text else { return nil }
        return Int(numberPasswords)
    }
    var passwordLength: Int? {
        guard let passwordLength = passwordLengthTextField.text else { return nil }
        return Int(passwordLength)
    }
    var rules: RulesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gerador de senhas"
        navigationController?.navigationBar.barTintColor = UIColor.secondarySystemBackground
    }
    
    @IBAction func generatePasswordTapped(_ sender: UIButton) {
        getRules()
        if isValidTextFields() {
            guard let numberPassword = numberPassword,
                  let rules = rules else { return }
            coordinator?.showPasswords(with: numberPassword, and: rules)
        } else {
            coordinator?.showSingleCustomAlert(title: "Campo inválido", message: "Preencha os campos corretamente")
        }
    }
    
    func getRules() {
        guard let passwordLength = self.passwordLength else { return }
        rules = RulesModel(passwordLength,
                           useSmallLettersSwitch.isOn,
                           useCapitalLettersSwitch.isOn,
                           useDigitsSwitch.isOn,
                           useSpecialCharactersSwitch.isOn)
    }
    
    func isValidTextFields() -> Bool {
        return numberPassword != nil && passwordLength != nil
    }
}
