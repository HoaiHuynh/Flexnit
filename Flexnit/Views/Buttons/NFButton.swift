//
//  NFButton.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 19/03/2024.
//

import UIKit

class NFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder: ) has not been implemented")
    }
    
    init(color: UIColor, title: String, systemImageName: String) {
        super.init(frame: .zero)
        
        
        configuration = .tinted()
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
        configuration?.cornerStyle = .medium
        configuration?.title = title.capitalizeFirstLetter()
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 8
        
        translatesAutoresizingMaskIntoConstraints = false
    }

}
