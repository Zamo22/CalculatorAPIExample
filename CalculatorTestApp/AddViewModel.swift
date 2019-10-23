//
//  AddViewModel.swift
//  CalculatorTestApp
//
//  Created by Zaheer Moola on 2019/10/23.
//  Copyright © 2019 DVT. All rights reserved.
//

import Foundation
import Alamofire

class AddViewModel {
    let additionRepo: AdditionRepository
    let additionView: AdditionCalculatorViewController

    init(repo: AdditionRepository, view: AdditionCalculatorViewController) {
        additionRepo = repo
        additionView = view
    }

    func addNumbers(firstNumber: Int, secondNumber: Int) {
        let numbersArray = [firstNumber, secondNumber]
        additionRepo.calculateSum(with: numbersArray) { [weak self] result in
            switch result {
            case .success(let total):
                self?.additionView.updateResult(result: "\(total)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
