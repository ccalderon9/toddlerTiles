//
//  GameTileCell.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 2/4/21.
//

import UIKit

// Boss / Delegating object - HAS info

@objc protocol GameTileCellProtocol {
    func didTapImageView(for cell: GameTileCell)
}

class GameTileCell: UICollectionViewCell {
    
    static let reuseID = "GameTileCell"
    var gameTileImageView = TTImageView(frame: .zero)
    
    var gesture: UITapGestureRecognizer?
    weak var delegate: GameTileCellProtocol?

    var isHandleTapExecuted = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        gameTileImageView.isUserInteractionEnabled = true
        gameTileImageView.addGestureRecognizer(gesture!)

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
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapImageView(for: self)
        // calls the delegate method
        // "Whoever is the delegate, now's the time to execute prot func."
        isHandleTapExecuted = true
        print(isHandleTapExecuted)
    }
}

