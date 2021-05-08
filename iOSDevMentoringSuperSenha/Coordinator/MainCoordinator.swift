//
//  MainCoordinator.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
//    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PasswordGeneratorViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPasswords() {
        let vc = ShowPasswordsViewController.instantiate()
        vc.coordinator = self
        vc.passwordGeneratorViewModel = PasswordGeneratorViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSafetyTips() {
        let vc = SafetyTipsViewController.instantiate()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController.present(vc, animated: true, completion: nil)
    }
//
//    func childDidFinish(_ child: Coordinator?) {
//        for (index, coordinator) in childCoordinators.enumerated() {
//            if coordinator === child {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
////    }
//
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//
//        /*if let originOfSomeChildCoordinatorViewController = fromViewController as? SomeViewController {
//            childDidFinish(originOfSomeChildCoordinatorViewController.coordinator)
//        }*/
//    }
}
