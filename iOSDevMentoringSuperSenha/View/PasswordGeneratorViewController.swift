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
    var setupNavBar: (() -> Void)?
//    var alert = Alert()
    
    var numberPassword: Int? {
        guard let numberPasswords = numberPasswordsTextField.text else { return nil }
        return Int(numberPasswords)
    }
    var passwordLength: Int? {
        guard let passwordLength = passwordLengthTextField.text else { return nil }
        return Int(passwordLength)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setupNavBar?()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        alert.delegate = self
        setupUI()
    }
    
    func setupUI() {
        title = "Gerador de senhas"
        navigationController?.navigationBar.barTintColor = UIColor.secondarySystemBackground
    }
    
    @IBAction func generatePasswordTapped(_ sender: UIButton) {
//        if textFieldsAreValid() {
        if isValidTextFields() {
//            coordinator?.showPasswords(delegate: self)
            coordinator?.showPasswords()
        } else {
            showSingleCustomAlert(title: "Campo inválido", message: "Preencha os campos corretamente")
//            alert.showAlert(title: "Campo inválido", message: "Preencha os campos corretamente")
        }
    }
    
    func getRules() -> (numberPasswords: Int, rules: RulesModel)? {
        guard let numberPasswords = self.numberPassword else { return nil }
        guard let passwordLength = self.passwordLength else { return nil }
        
        let rulesDTO = RulesModel(passwordLength,
                                  useSmallLettersSwitch.isOn,
                                  useCapitalLettersSwitch.isOn,
                                  useDigitsSwitch.isOn,
                                  useSpecialCharactersSwitch.isOn)
        
        return (numberPasswords, rulesDTO)
    }
    
//    func textFieldsAreValid() -> Bool
//    {
//        guard let numberPasswords = numberPasswordsTextField.text else { return false }
//        guard let passwordLength = passwordLengthTextField.text else { return false }
//        guard let _ = Int(numberPasswords) else { return false }
//        guard let _ = Int(passwordLength) else { return false }
//        return true
//    }
    
    func isValidTextFields() -> Bool {
        return numberPassword != nil && passwordLength != nil
    }
}
