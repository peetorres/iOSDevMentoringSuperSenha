//
//  PasswordGeneratorViewModel.swift
//  iOSDevMentoringSuperSenha
//
//  Created by Pedro Gabriel on 08/05/21.
//

import Foundation

class PasswordGeneratorViewModel {
    var numberPassword: Int?
    var passwordLength: Int?
    var rules: RulesModel?
    
    func isValidTextFields() -> Bool {
        return numberPassword != nil && passwordLength != nil
    }
}
