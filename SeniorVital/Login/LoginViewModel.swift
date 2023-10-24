//
//  LoginViewModel.swift
//  SeniorVital
//
//  Created by Zijing Wu on 06/10/23.
//

import RxCocoa
import RxSwift
import Foundation

class LoginViewModel {
    static let validationErrorMessage = "Invalid user name or password"
    // MARK: Input
    let userName: Driver<String>
    let password: Driver<String>
    let doLogin: Driver<()>
    
    // MARK: Output
    var authenticatedResult: Driver<Bool>!
    
    init(userName: Driver<String>, password: Driver<String>, doLogin: Driver<()>) {
        self.userName = userName
        self.password = password
        self.doLogin = doLogin
        
        let loginParams = Driver.combineLatest(
            userName.distinctUntilChanged(),
            password.distinctUntilChanged()
        ) { (userName: $0, password: $1) }
        
        authenticatedResult = doLogin
            .withLatestFrom(loginParams)
            .flatMapLatest { [weak self] pair in
                if self == nil {
                    return Driver.empty()
                }
                
                return self!.login(userName: pair.userName, password: pair.password)
        }
    }
    
    private func login(userName: String, password: String) -> Driver<Bool> {
        if password.isEmpty || userName.isEmpty {
            return Driver.just(false)
        }
        if let user = Utils.readUser(), user.userName == userName && user.password == password {
            return Driver.just(true)
        }
        return Driver.just(false)
    }
    
}

