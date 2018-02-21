//
//  VolumesViewController.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Nuke

class VolumesViewController: UIViewController {

    private var volumes: BehaviorRelay<[Volume]> = BehaviorRelay(value: [])
    private let apiClient = APIClient.sharedInstance
    private var disposeBag = DisposeBag()
    private let contentView: VolumesView = VolumesView()
    private let searchText = Variable<String?>(nil)

    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setSearchView()
    }

    // MARK: - Setting collection view to work with data
    func setCollectionView(){
        volumes.asObservable().bind(to: contentView.collectionView.rx.items(cellIdentifier: VolumesView.volumeCellId, cellType: VolumesViewCell.self)) { (row, element, cell) in
            guard let info = element.volumeInfo else {
                cell.textLabel.text = nil
                cell.imageView.image = nil
                return
            }
            cell.textLabel.text = info.title
            if let link = info.imageLinks?.smallThumbnail, let url = URL(string: link) {
                Manager.shared.loadImage(with: url, into: cell.imageView)
            }
        }.disposed(by: disposeBag)
        contentView.collectionView.rx.didScroll.subscribe(onNext: { [weak self] scroll in
            self?.contentView.searchBar.resignFirstResponder()
        }).disposed(by: disposeBag)
        contentView.collectionView.rx.itemSelected.subscribe(onNext: { [weak self] index in
            let vc = DetailsViewController(info: self?.volumes.value[index.item].volumeInfo)
            self?.navigationController?.show(vc, sender: self)
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Setting view to search
    func setSearchView(){
        contentView.searchBar.rx.text
            .asDriver()
            .drive(searchText)
            .disposed(by: disposeBag)
        
        searchText.asObservable().skip(1).subscribe(onNext: { [weak self] text in
            self?.contentView.searchBar.text = text
        }).disposed(by: disposeBag)
        
        searchText.asObservable().skip(1).subscribe(onNext: { [weak self] text in
            self?.downloadDataFor(text)
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Method to download data
    func downloadDataFor(_ query: String?) {
        guard let q = query, !q.isEmpty else {
            self.volumes.accept([])
            return
        }
        apiClient.getVolumes(query: q).subscribe{ [weak self] event in
            switch event {
            case .next(let result):
                guard !result.isEmpty else {
                    break
                }
                self?.volumes.accept(result)
            default:
                break
            }
        }.disposed(by: disposeBag)
    }

}
