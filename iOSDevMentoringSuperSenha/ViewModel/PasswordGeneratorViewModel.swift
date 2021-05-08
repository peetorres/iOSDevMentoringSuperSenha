//
//  PasswordGeneratorViewModel.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

protocol PasswordGeneratorViewModelDelegate {
    func didGeneratedPassword()
}

class PasswordGeneratorViewModel {
    var numberPasswords: Int
    var rules: RulesModel
    var passwords = [String]()
    var delegate: PasswordGeneratorViewModelDelegate?
    
    init(numberPasswords: Int, rules: RulesModel) {
        self.numberPasswords = numberPasswords
        self.rules = rules
    }
    
    func generatePassword(dto: RulesModel) -> String? {
        let rules = RulesModel(dto.passwordLength,
                               dto.useSmallLetters,
                               dto.useCapitalLetters,
                               dto.useDigits,
                               dto.useSpecialCharacters)
        return PasswordGenerator.generate(rules: rules)
    }
    
    func generatePasswords() {
        passwords = []
        while passwords.count < numberPasswords {
            if let password = generatePassword(dto: rules){
                passwords.append(password)
            }
        }
        delegate?.didGeneratedPassword()
    }
}
