//
//  MainCoordinator.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PasswordGeneratorViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPasswords(with numberPassword: Int, and rules: RulesModel) {
        let vc = ShowPasswordsViewController.instantiate()
        vc.numberPasswords = numberPassword
        vc.rules = rules
        vc.coordinator = self
        vc.passwordGeneratorViewModel = PasswordGeneratorViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSafetyTips() {
        let vc = SafetyTipsViewController.instantiate()
//        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController.present(vc, animated: true, completion: nil)
    }
}
