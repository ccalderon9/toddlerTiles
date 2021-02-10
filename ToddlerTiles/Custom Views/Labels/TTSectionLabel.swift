//
//  TTSectionLabel.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 2/1/21.
//

import UIKit

class TTSectionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        font                                      = UIFont.preferredFont(forTextStyle: .body)
        textAlignment                             = .left
        textColor                                 = .lightGray
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.9
        lineBreakMode                             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
