//
//  VolumesView.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation
import UIKit
import Yalta

class VolumesView: UIView {
    
    static let volumeCellId = "volumeCellId"

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        let itemSize = CGSize(width: screenWidth, height: 56)
        layout.itemSize = itemSize
        layout.estimatedItemSize = itemSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.register(VolumesViewCell.self, forCellWithReuseIdentifier: VolumesView.volumeCellId)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(collectionView) { collectionView in
            collectionView.edges.pinToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
