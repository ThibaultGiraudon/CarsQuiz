//
//  Bundle+decode.swift
//  AutoQuiz
//
//  Created by Thibault Giraudon on 28/05/2024.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [Car] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Car].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
