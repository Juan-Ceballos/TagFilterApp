//
//  Plumbers.swift
//  TagFilterApp
//
//  Created by Juan Ceballos on 2/22/22.
//

import Foundation

struct Plumber: Decodable {
    let name: String
    let tags: [String]
    let description: String
    
    static func getPlumbers() -> [Plumber] {
        var plumbers = [Plumber]()
        
        guard let fileURL = Bundle.main.url(forResource: "plumbers", withExtension: ".json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let plumberData = try JSONDecoder().decode([Plumber].self, from: data)
            plumbers = plumberData
        } catch  {
            fatalError()
        }
        
        return plumbers
    }
}


