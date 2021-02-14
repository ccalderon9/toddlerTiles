//
//  CollectionViewController.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 2/3/21.
//

import UIKit

// Intern - DISPLAYS info

class GameTileCVC: UICollectionViewController {

    var section = ""

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.hideNavigationItemBackground()
        
        // TEST: on physical device. Possibly remove if interferes with game.
       // navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .black
        self.collectionView!.register(GameTileCell.self, forCellWithReuseIdentifier: GameTileCell.reuseID)
    }
}

// MARK: UICollectionViewDataSource / Delegate

extension GameTileCVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameTileCell.reuseID, for: indexPath) as! GameTileCell
        setImageAndColor(for: cell)
        cell.delegate = self
        return cell
    }
    

    func setImageAndColor(for cell: GameTileCell) {
        let randomNumber = Int.random(in: 1...30)
        cell.gameTileImageView.image = UIImage(named: "\(self.section)\(randomNumber)")
        if self.section == "Flowers" {
            let lightColor = Int.random(in: 16...30)
            cell.gameTileImageView.backgroundColor = UIColor(named: "color\(lightColor)")
        } else {
            let primaryColor = Int.random(in: 1...15)
            cell.gameTileImageView.backgroundColor = UIColor(named: "color\(primaryColor)")
        }
    }
}


extension GameTileCVC: GameTileCellProtocol {
    func didTapImageView(for cell: GameTileCell) {
        UIView.animate(withDuration: 0.4) {
            cell.gameTileImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        } completion: { (_ finished: Bool) in
            UIView.animate(withDuration: 0.4) {
                self.setImageAndColor(for: cell)
                cell.gameTileImageView.transform = CGAffineTransform.identity
            }
        }
        print(#function)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension GameTileCVC: UICollectionViewDelegateFlowLayout {
    // Defines the minimum spacing between rows.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    // Defines the minimum spacing between columns.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    // Defines section insets.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding: CGFloat = 7
        let sectionInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        return sectionInsets
    }
    
    // Defines the size of each cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 15
        var height: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            let topPadding = window.safeAreaInsets.top
            height = ((view.frame.height - topPadding) / 3) - 40 // - 21 to scroll and obscure title.
        }
        
        return CGSize(width: width, height: height) // parameters must be CGFloat
    }
}
