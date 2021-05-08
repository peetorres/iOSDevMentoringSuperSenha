//
//  PasswordGeneratorViewModel.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

class PasswordGeneratorViewModel {
    func generatePassword(dto: RulesModel) -> String? {
        let rules = RulesModel(dto.passwordLength,
                               dto.useSmallLetters,
                               dto.useCapitalLetters,
                               dto.useDigits,
                               dto.useSpecialCharacters)
        return PasswordGenerator.generate(rules: rules)
    }
}
