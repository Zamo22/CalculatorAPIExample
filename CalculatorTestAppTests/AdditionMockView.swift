//
//  AdditionMockView.swift
//  CalculatorTestAppTests
//
//  Created by Zaheer Moola on 2019/10/23.
//  Copyright © 2019 DVT. All rights reserved.
//

import Foundation
@testable import CalculatorTestApp

class AdditionMockView: AdditionCalculatorViewController {
    var counter = 0
    var errorCounter = 0

    func updateResult(result: String) {
        counter += 1
    }

    func displayError(error: Error) {
        errorCounter += 1
    }

    func resetCounters() {
        counter = 0
        errorCounter = 0
    }

    func verifyResult() -> Bool {
        return counter == 1
    }

    func verifyError() -> Bool {
        return errorCounter == 1
    }
}
