//
//  SectionCell.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 1/29/21.
//

import UIKit


class SectionCell: UICollectionViewCell {
    
    static let reuseID = "SectionCell"
    var sectionImageView = TTImageView(frame: .zero)
    var sectionTitle = TTSectionLabel(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        contentView.addSubview(sectionImageView)
        contentView.addSubview(sectionTitle)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            sectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sectionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            sectionTitle.topAnchor.constraint(equalTo: sectionImageView.bottomAnchor, constant: padding),
            sectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            sectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            sectionTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            sectionTitle.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
