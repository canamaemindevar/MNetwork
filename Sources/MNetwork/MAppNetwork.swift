//
//  CoreNetworkManager.swift
//  MovieApp
//
//  Created by Emincan Antalyalı on 6.11.2023.
//

import Foundation

protocol CoreNetworkManagerInterface {
    func request<T: Codable>(_ endpoint: Endpoint,completion: @escaping((Result<T,ErrorTypes>)->()))
}

public final class CoreNetworkManager: CoreNetworkManagerInterface {

    public init() {}

    public func request<T: Codable>(_ endpoint: Endpoint, completion: @escaping (Result<T, ErrorTypes>) -> Void) {

        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in

            if error != nil {
             //   Logger.shared.log(text: ErrosTypes.generalError.rawValue)
                print(ErrorTypes.generalError.rawValue)
                completion(.failure(.generalError))
                return
            }

            guard let response = response as? HTTPURLResponse else { return }
            switch response.statusCode
            {
                case  200 ... 299 :
                self.handleResponse(data: data) { response in
                    completion(response)
                }
                case 300 ... 399:
                    completion(.failure(.redirectionError300))
                case 400 ... 499:
                    completion(.failure(.clientError400))
                default:
                    completion(.failure(.generalError))
            }
        }
        task.resume()
    }

    //MARK:  Handle func

    fileprivate func handleResponse<T: Codable>(data: Data?, completion: @escaping( (Result<T,ErrorTypes>)-> () ) ) {

        guard let data = data else {
            completion(.failure(.noData))
            return
        }

        do {
            let succesData =  try JSONDecoder().decode(T.self, from: data)
            completion(.success(succesData))
        } catch  {
           // Logger.shared.log(text: String(describing: error))
            print(error)
            completion(.failure(.parsingError))
        }

    }
}
