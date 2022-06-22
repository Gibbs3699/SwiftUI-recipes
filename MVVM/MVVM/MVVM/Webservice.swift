//
//  Webservice.swift
//  MVVM
//
//  Created by TheGIZzz on 22/6/2565 BE.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
}


class Webservice {
    func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.badRequest))
                return
            }
            
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            completion(.success(posts ?? []))
        }
        .resume()
    }
}
