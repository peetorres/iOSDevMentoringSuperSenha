//
//  Coordinator.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import Foundation
import UIKit

protocol Coordinator {
//    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
