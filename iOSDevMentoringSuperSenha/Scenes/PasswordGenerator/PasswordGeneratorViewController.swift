//
//  PasswordGeneratorViewController.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import UIKit

class PasswordGeneratorViewController: UIViewController, Storyboarded {
    @IBOutlet weak var numberPasswordsTextField: UITextField!
    @IBOutlet weak var passwordLengthTextField: UITextField!
    @IBOutlet weak var useSmallLettersSwitch: UISwitch!
    @IBOutlet weak var useCapitalLettersSwitch: UISwitch!
    @IBOutlet weak var useDigitsSwitch: UISwitch!
    @IBOutlet weak var useSpecialCharactersSwitch: UISwitch!
    
    var coordinator: MainCoordinator?
    var viewModel = PasswordGeneratorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gerador de senhas"
        navigationController?.navigationBar.barTintColor = UIColor.secondarySystemBackground
        numberPasswordsTextField.addTarget(self, action: #selector(numberPasswordsChanged), for: .editingChanged)
        passwordLengthTextField.addTarget(self, action: #selector(passwordLengthChanged), for: .editingChanged)
    }
    
    @objc
    func numberPasswordsChanged() {
        guard let numberPasswords = numberPasswordsTextField.text else { return }
        viewModel.numberPassword = Int(numberPasswords)
    }
    
    @objc
    func passwordLengthChanged() {
        guard let passwordLength = passwordLengthTextField.text else { return }
        viewModel.passwordLength = Int(passwordLength)
    }
    
    @IBAction func generatePasswordTapped(_ sender: UIButton) {
        setupRules()
        handleButtonAction()
    }
    
    func setupRules() {
        guard let passwordLength = viewModel.passwordLength else { return }
        viewModel.rules = RulesModel(passwordLength,
                                     useSmallLettersSwitch.isOn,
                                     useCapitalLettersSwitch.isOn,
                                     useDigitsSwitch.isOn,
                                     useSpecialCharactersSwitch.isOn)
    }
    
    func handleButtonAction() {
        if viewModel.isValidTextFields() {
            guard let numberPassword = viewModel.numberPassword,
                  let rules = viewModel.rules else { return }
            coordinator?.showPasswords(with: numberPassword, and: rules)
        } else {
            coordinator?.showSingleCustomAlert(title: "Campo inválido", message: "Preencha os campos corretamente")
        }
    }
}
