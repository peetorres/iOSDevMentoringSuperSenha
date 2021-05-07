//
//  PasswordGeneratorViewModel.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

class PasswordGeneratorViewModel {
    func generatePassword(dto: RulesDTO) -> String? {
        let rules = Rules(dto.passwordLength, dto.useSmallLetters, dto.useCapitalLetters, dto.useDigits, dto.useSpecialCharacters)
        return PasswordGenerator.generate(rules: rules)
    }
}
