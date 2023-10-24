//
//  LoginViewController.swift
//  SeniorVital
//
//  Created by Zijing Wu on 05/10/23.
//

import Foundation
import RxSwift
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var authErrorMessageLabel: UILabel!
    
    private var viewModel: LoginViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel(userName:  userNameTextField.rx.text.orEmpty.asDriver(), password: passwordTextField.rx.text.orEmpty.asDriver(), doLogin: loginButton.rx.tap.asDriver())
        
        authErrorMessageLabel.isHidden = true
        authErrorMessageLabel.text = LoginViewModel.validationErrorMessage
        
        bindUI()
        updateUI()
    }
    
    private func bindUI() {
        viewModel.authenticatedResult
            .drive(onNext: { [weak self] result in
                if result {
                    self?.passwordTextField.text = ""
                    self?.userNameTextField.text = ""
                    self?.performSegue(withIdentifier: "goDashboard", sender: self)
                } else {
                    self?.authErrorMessageLabel.isHidden = false
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func updateUI() {
        userNameTextField.rx
            .controlEvent([.editingDidEndOnExit, .editingChanged])
            .asDriver()
            .drive(onNext: { [weak self] _ in
                self?.authErrorMessageLabel.isHidden = true
            })
            .disposed(by: disposeBag)
        
        passwordTextField.rx
            .controlEvent([.editingDidEndOnExit, .editingChanged])
            .asDriver()
            .drive(onNext: { [weak self] _ in
                self?.authErrorMessageLabel.isHidden = true
            })
            .disposed(by: disposeBag)
    }
}
