//
//  AdditionViewModelTests.swift
//  CalculatorTestAppTests
//
//  Created by Zaheer Moola on 2019/10/23.
//  Copyright © 2019 DVT. All rights reserved.
//

import Foundation
import XCTest
@testable import CalculatorTestApp

class AdditionViewModelTests: XCTestCase {

    var objectUnderTest: AddViewModel?
    var mockView: AdditionMockView!
    var mockRepo: AdditionMockRepository!

    override func setUp() {
        mockView = AdditionMockView()
        mockRepo = AdditionMockRepository()
        objectUnderTest = AddViewModel(repo: mockRepo, view: mockView)
    }

    override func tearDown() {
        objectUnderTest = nil
        mockView.resetCounters()
    }

    func testFetchingSumOfTwoNumbersWillUpdateViewWithResult() {
        objectUnderTest?.addNumbers(firstNumber: 20, secondNumber: 30)
        XCTAssert(mockView?.verifyResult() == true)
    }

    func testFetchingSumOfTwoNumbersWhereNetworkReturnsErrorUpdatesViewWithError() {
        objectUnderTest?.addNumbers(firstNumber: 5, secondNumber: 1)
        XCTAssert(mockView.verifyError() == true)
    }
}
