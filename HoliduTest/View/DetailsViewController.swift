//
//  DetailsViewController.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import UIKit
import RxSwift
import Nuke

class DetailsViewController: UIViewController {
    
    private let apiClient = APIClient.sharedInstance
    private var disposeBag = DisposeBag()
    private let contentView: DetailsView = DetailsView()
    
    private var info: VolumeInfo? {
        didSet {
            guard let info = info else {
                return
            }
            contentView.textLabel.text = info.title
            contentView.authorsLabel.text = (info.authors ?? []).joined(separator: ",")
            contentView.descriptionLabel.text = info.description
        }
    }
    
    convenience init(info: VolumeInfo?) {
        self.init(nibName:nil, bundle:nil)
        
        defer {
            self.info = info
        }
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
