//
//  ViewController.swift
//  CalculatorTestApp
//
//  Created by Zaheer Moola on 2019/10/23.
//  Copyright © 2019 DVT. All rights reserved.
//

import UIKit

protocol AdditionCalculatorViewController {
    func updateResult(result: String)
}

class ViewController: UIViewController, AdditionCalculatorViewController {
    @IBOutlet private weak var screenLabel: UILabel!
    var viewModel: AddViewModel?
    private var firstNumber = 0
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        let repository = AdditionRepositoryImplementation()
        viewModel = AddViewModel(repo: repository, view: self)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let numberToAdd = Int(screenLabel?.text ?? "0") else { return }
        viewModel?.addNumbers(firstNumber: firstNumber, secondNumber: numberToAdd)
        activityIndicator.startAnimating()
    }


    @IBAction func addButtonTapped(_ sender: UIButton) {
        if let screenText = screenLabel.text, let convertedNumber = Int(screenText) {
            firstNumber = convertedNumber
        }
        screenLabel.text = "0"
    }

    func updateResult(result: String) {
        activityIndicator.stopAnimating()
        screenLabel.text = result
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        screenLabel.text?.append("\(sender.tag)")
    }
}

