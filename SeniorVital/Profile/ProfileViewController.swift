//
//  ProfileViewController.swift
//  SeniorVital
//
//  Created by Zijing Wu on 09/10/23.
//

import Foundation
import UIKit
import RxSwift

class ProfileViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
    }

    private func bindUI() {
        logoutButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.performSegue(withIdentifier: "goLogin", sender: self)
            })
            .disposed(by: disposeBag)
    }
}
