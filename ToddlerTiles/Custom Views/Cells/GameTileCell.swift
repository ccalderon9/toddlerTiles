//
//  GameTileCell.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 2/4/21.
//

import UIKit


class GameTileCell: UICollectionViewCell {
    
    static let reuseID = "GameTileCell"
    var gameTileImageView = TTImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(gameTileImageView)
        
        NSLayoutConstraint.activate([
            gameTileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gameTileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gameTileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gameTileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
