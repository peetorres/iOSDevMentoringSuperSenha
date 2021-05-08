//
//  SafetyTipsViewController.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import UIKit

class SafetyTipsViewController: UIViewController, Storyboarded {
//    var coordinator: MainCoordinator?
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
//        coordinator?.dismissModal(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
