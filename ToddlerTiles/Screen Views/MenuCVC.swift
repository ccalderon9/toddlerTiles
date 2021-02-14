//
//  ViewController.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 1/29/21.
//

import UIKit

class MenuCVC: UICollectionViewController {
    
    let titleLabel = UILabel()
    let colorsArr = ["color16", "color2", "color3"]
    let titles = ["Flowers", "Candies", "Biology"]
    let images = ["Flowers1", "Candies1", "Biology1"]

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .black
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: SectionCell.reuseID)
        
        view.addSubview(titleLabel)
        configureTitleLabel()
    }
    
    // TODO: Try replacing titleLabel with navigationBar.title.
    
    func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Begin Learning"
        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK:- UICollectionViewDelegate/DataSource

extension MenuCVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCell.reuseID, for: indexPath) as! SectionCell

        let color = colorsArr[indexPath.row]
        cell.sectionImageView.backgroundColor = UIColor(named: color)

        let image = images[indexPath.row]
        cell.sectionImageView.image = UIImage(named: image)
        
        let title = titles[indexPath.row]
        cell.sectionTitle.text = title
        return cell
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let destVC = GameTileCVC(collectionViewLayout: layout)
        
        destVC.section = titles[indexPath.item]
        navigationController?.pushViewController(destVC, animated: true)
    }
}

// MARK:- UICollectionViewDelegateFlowLayout

extension MenuCVC: UICollectionViewDelegateFlowLayout {
    
    // Defines the min. spacing between rows.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    // Defines the min. spacing between columns.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding: CGFloat = 20
        let sectionInsets = UIEdgeInsets(top: 50, left: padding, bottom: padding, right: padding)
        return sectionInsets
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 27
        
        return CGSize(width: width, height: width)
    }
}
