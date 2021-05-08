//
//  ViewController.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import UIKit

class ShowPasswordsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var passwordsTextView: UITextView!
    
    var coordinator: MainCoordinator?
    var viewModel: ShowPasswordsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        viewModel?.delegate = self
        viewModel?.generatePasswords()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Gerador de senhas", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor(red: 155/255.0, green: 36/255.0, blue: 101/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 238/255.0, green: 179/255.0, blue: 217/255.0, alpha: 1)
    }

    @IBAction func generatePasswordAgainTapped(_ sender: UIButton) {
        viewModel?.generatePasswords()
    }
    
    @IBAction func showSafetyTips(_ sender: UIButton) {
        coordinator?.showSafetyTips()
    }
    
    func showPasswords() {
        guard let passwords = viewModel?.passwords else { return }
        passwordsTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        passwordsTextView.text = ""
        for password in passwords {
            passwordsTextView.text.append(password + "\n\n")
        }
    }
}

extension ShowPasswordsViewController: ShowPasswordsViewModelDelegate {
    func didGeneratedPassword() {
        showPasswords()
    }
}
