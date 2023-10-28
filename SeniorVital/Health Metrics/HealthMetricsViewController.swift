//
//  HealthMetricsViewController.swift
//  SeniorVital
//
//  Created by Zijing Wu on 09/10/23.
//

import Foundation
import UIKit
import RxSwift

class HealthMetricsViewController: UIViewController {
    private var viewModel: HealthMetricsViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var stepsCountLabel: UILabel!
    @IBOutlet weak var bloodPressureLabel: UILabel!
    @IBOutlet weak var heartRateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HealthMetricsViewModel()
        bindUI()
    }
    
    private func bindUI() {
        viewModel.bloodPressure
            .drive(onNext: { [weak self] text in
                self?.bloodPressureLabel.text = text
            })
            .disposed(by: disposeBag)
        
        viewModel.heartRate
            .drive(onNext: { [weak self] text in
                self?.heartRateLabel.text = text
            })
            .disposed(by: disposeBag)
        
        viewModel.stepsCount
            .drive(onNext: { [weak self] text in
                self?.stepsCountLabel.text = text
            })
            .disposed(by: disposeBag)
    }
}
