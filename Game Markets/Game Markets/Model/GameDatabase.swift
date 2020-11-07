//
//  GameDatabase.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 09/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import UIKit

struct Result: Identifiable {
    var id = UUID()
    var name: String
    var released: String
    var background_image: String
    var rating: Double
    var ratings_count: Int
    var added: Int
    var reviews_count: Int
    
    init(name: String, released: String, background_image: String, rating: Double, rating_count: Int, added: Int, reviews_count: Int) {
        self.name = name
        self.released = released
        self.background_image = background_image
        self.rating = rating
        self.ratings_count = rating_count
        self.added = added
        self.reviews_count = reviews_count
    }
    
}

extension Result: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case released
        case background_image
        case rating
        case ratings_count
        case added
        case reviews_count
    }
    
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        //non Nested JSON Object
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        released = try values.decode(String.self, forKey: .released)
        background_image = try values.decode(String.self, forKey: .background_image)
        rating = try values.decode(Double.self, forKey: .rating)
        ratings_count = try values.decode(Int.self, forKey: .ratings_count)
        added = try values.decode(Int.self, forKey: .added)
        reviews_count = try values.decode(Int.self, forKey: .reviews_count)
    
        
        // Nested JSON Object
        
        
    }
}

class ResultStore: Decodable, ObservableObject {
    
    /*
    we will display the loans using a List view. So, other than Decodable,
    we have to adopt the ObservableObject protocol and mark the loans variable with the @Published
    */
    
    // generate variable which save the URL
    private static var url = "https://api.rawg.io/api/games"
    @Published var results: [Result] = []
    
    enum CodingKeys: CodingKey {
        case results
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decode([Result].self, forKey: .results)
    }

    init() {

    }
    
    func fetchLatestLoans() {
        guard let gameURL = URL(string: Self.url) else {
            return
        }

        let request = URLRequest(url: gameURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in

            if let error = error {
                print(error)
                return
            }

            // Parse JSON data
            if let data = data {
                DispatchQueue.main.async {
                    self.results = self.parseJsonData(data: data)
                }

            }
        })

        task.resume()
    }

    func parseJsonData(data: Data) -> [Result] {

        let decoder = JSONDecoder()

        do {

            let gameStore = try decoder.decode(ResultStore.self, from: data)
            self.results = gameStore.results

        } catch {
            print(error)
        }

        return results
    }
    
}


