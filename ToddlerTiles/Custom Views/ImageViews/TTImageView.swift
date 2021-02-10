//
//  TTImageView.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 2/1/21.
//

import UIKit

class TTImageView: UIImageView {

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 13
        clipsToBounds       = true
        contentMode         = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
