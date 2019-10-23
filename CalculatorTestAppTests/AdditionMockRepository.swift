//
//  AdditionMockRepository.swift
//  CalculatorTestAppTests
//
//  Created by Zaheer Moola on 2019/10/23.
//  Copyright © 2019 DVT. All rights reserved.
//

import Foundation
@testable import CalculatorTestApp

class AdditionMockRepository: AdditionRepository {
    func calculateSum(with numbers: [Int], completion: @escaping (Result<Int, Error>) -> Void) {
        if numbers == [20, 30] {
            completion(.success(50))
        } else {
            let err = NSError()
            completion(.failure(err))
        }
    }
}
