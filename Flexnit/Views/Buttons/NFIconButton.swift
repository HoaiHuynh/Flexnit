//
//  NFIconButton.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 20/03/2024.
//

import UIKit

class NFIconButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder: ) has not been implemented")
    }

    init(color: UIColor, systemImageName: String) {
        super.init(frame: .zero)
        
        configuration = .plain()
        
        configuration?.image = UIImage(systemName: systemImageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        configuration?.baseForegroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
    }
}
