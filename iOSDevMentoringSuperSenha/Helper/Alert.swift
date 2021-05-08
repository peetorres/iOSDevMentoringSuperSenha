//
//  Alert.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 07/05/21.
//

import UIKit

extension UIViewController {
    func showSingleCustomAlert(title: String, message: String) {
        let alertControler = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertControler.addAction(dismissAction)
        present(alertControler, animated: true, completion: nil)
    }
}
