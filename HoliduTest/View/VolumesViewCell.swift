//
//  VolumesViewCell.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation
import UIKit
import Yalta

class VolumesViewCell: UICollectionViewCell {
    
    public let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    public let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let screenWidth =  UIScreen.main.bounds.width
        self.addSubview(textLabel, imageView) { textLabel, imageView in
            imageView.edges(.left, .top, .bottom).pinToSuperview()
            imageView.width.set(56)
            textLabel.edges(.right, .top, .bottom).pinToSuperview()
            textLabel.left.align(with: imageView.right, offset: 8)
        }
        Constraints(for: self.contentView) { view in
            view.width.set(screenWidth)
            view.height.set(56)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.textLabel.text = nil
        self.imageView.image = nil
    }
    
}
