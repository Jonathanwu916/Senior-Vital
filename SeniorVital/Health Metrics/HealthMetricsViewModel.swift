//
//  HealthMetricsViewModel.swift
//  SeniorVital
//
//  Created by Zijing Wu on 10/10/23.
//

import RxCocoa
import RxSwift
import Foundation

class HealthMetricsViewModel {
    // MARK: Output
    var heartRate: Driver<String>!
    var bloodPressure: Driver<String>!
    var stepsCount: Driver<String>!
    
    init() {
        if let user = Utils.readUser(){
            heartRate = Driver.just("Heart Rate: " + user.heartRate)
            bloodPressure = Driver.just("Blood Pressure: " + user.bloodPressure)
            stepsCount = Driver.just("Steps Count: " + user.stepsCount)
        }
    }
}
