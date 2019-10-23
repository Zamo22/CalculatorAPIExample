//
//  AdditionRepository.swift
//  CalculatorTestApp
//
//  Created by Zaheer Moola on 2019/10/23.
//  Copyright © 2019 DVT. All rights reserved.
//

import Foundation
import Alamofire

protocol AdditionRepository {
    func calculateSum(with numbers: [Int], completion: @escaping (Result<Int, Error>) -> Void)
}

class AdditionRepositoryImplementation: AdditionRepository {

    func calculateSum(with numbers: [Int], completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: "https://c8r.azurewebsites.net/api/add?code=aKHx1nNzQpgy9WXzNOJnJR4a/KpX05PTepvQeCvoq7CbanG84Ng81A==") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: numbers)

        AF.request(request).responseJSON { response in
            if let error = response.error  {
                completion(.failure(error))
            } else {
                let decoder = JSONDecoder()
                guard let data = response.data, let resultModel = try? decoder.decode(AdditionResultModel.self, from: data) else { return }
                completion(.success(resultModel.result))
            }
        }
    }
}


