//
//  MoneyPresenter.swift
//  MoneyMoney
//
//  Created by Evgeny Semenov on 05/02/2020.
//  Copyright © 2020 Evgeny Semenov. All rights reserved.
//

import Foundation

protocol MoneyServiceProtocol {
	
	func downloadData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}

class MoneyService: MoneyServiceProtocol {
	
	let session: URLSession
	
	init(session: URLSession) {
		self.session = session
	}
	
	func downloadData<DataType: Decodable>(urlString: String, completion: @escaping (Result<DataType, Error>) -> Void) {
		
		do {
			guard let url = URL(string: urlString) else {
				throw NSError(domain: "BadUrl", code: 0, userInfo: [NSLocalizedDescriptionKey: "Некорректная ссылка"])
			}
			session.dataTask(with: url, completionHandler: { data, response, error in
				do {
					guard let data = data else {
						throw NSError(domain: NSURLErrorDomain, code: NSURLErrorCannotOpenFile, userInfo: [NSLocalizedDescriptionKey: "Пришли пустые данные"])
					}
					let resultJson = try JSONDecoder().decode(DataType.self, from: data)
					DispatchQueue.main.async {
						completion(.success(resultJson))
					}
				} catch let error {
					DispatchQueue.main.async {
						completion(.failure(error))
					}
				}
			}).resume()
		} catch let error {
			DispatchQueue.main.async {
				completion(.failure(error))
			}
		}
	}
}


