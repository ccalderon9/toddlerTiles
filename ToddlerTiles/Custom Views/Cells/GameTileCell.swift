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
    var hasBeenFlipped: Bool = false
    
    var gesture: UITapGestureRecognizer?
    weak var delegate: GameTileCellProtocol?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addTap()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addTap() {
        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        gameTileImageView.isUserInteractionEnabled = true
        gameTileImageView.addGestureRecognizer(gesture!)
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            delegate?.didTapImageView(for: self)
            // calls delegate method: "Whoever is the delegate, now's the time to execute prot func."
        }
    }

    
    private func configure() {
        contentView.addSubview(gameTileImageView)
        
        NSLayoutConstraint.activate([
            gameTileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gameTileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gameTileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gameTileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

