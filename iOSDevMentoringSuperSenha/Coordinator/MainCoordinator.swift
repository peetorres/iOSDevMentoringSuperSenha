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
//        let vc = PasswordGeneratorViewController.instantiate()
        let vc = SetupViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPasswords(with numberPassword: Int, and rules: RulesModel) {
        let vc = ShowPasswordsViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = ShowPasswordsViewModel(numberPasswords: numberPassword, rules: rules)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSingleCustomAlert(title: String, message: String) {
        let alertControler = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertControler.addAction(dismissAction)
        navigationController.present(alertControler, animated: true, completion: nil)
    }
    
    func showSafetyTips() {
        let vc = SafetyTipsViewController.instantiate()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController.present(vc, animated: true, completion: nil)
    }
}
