//
//  DetailsView.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation
import Yalta

class DetailsView: UIView {
    
    public let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    public let authorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(textLabel, authorsLabel, descriptionLabel) { textLabel, authorsLabel, descriptionLabel in
            textLabel.edges(.left, .top, .right).pinToSuperview()
            textLabel.height.set(44)
            authorsLabel.edges(.left, .right).pinToSuperview(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            authorsLabel.top.align(with: textLabel.bottom)
            authorsLabel.height.set(44)
            descriptionLabel.edges(.left, .right).pinToSuperview(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            descriptionLabel.top.align(with: authorsLabel.bottom)
            descriptionLabel.height.set(44)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

