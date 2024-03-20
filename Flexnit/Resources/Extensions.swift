//
//  Extensions.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 19/03/2024.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
