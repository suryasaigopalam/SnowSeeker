//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by surya sai on 26/06/24.
//

import Foundation

extension Bundle {
    func decode<T:Decodable>(_ file:String)->T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file) file")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode( T.self,from: data)
        }catch {
            fatalError("Error: \(error.localizedDescription)")
        }
    }
}
