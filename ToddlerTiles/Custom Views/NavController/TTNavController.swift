//
//  TTNavController.swift
//  ToddlerTiles
//
//  Created by Clarissa Calderon on 2/4/21.
//

import UIKit

class TTNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createMenuCVC()]
    }
    
    
    func createMenuCVC() -> UICollectionViewController {
        let layout = UICollectionViewFlowLayout()
        let menuCVC = MenuCVC(collectionViewLayout: layout)
        menuCVC.title = "Begin Learning"
        
        return menuCVC
    }

}
