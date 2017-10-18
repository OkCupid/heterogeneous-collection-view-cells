//
//  UsersViewController.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    var viewModels = [CollectionViewCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModels()
    }
    
    func setupViewModels() {
        let userFactory = UsersCollectionViewCellViewModelFactory()
        let advertisementFactory = AdvertisementCollectionViewCellViewModelFactory()
        
        let userViewModels = User.all.map { userFactory.create(user: $0, viewController: self) }
        viewModels.append(contentsOf: userViewModels)
        let ads = Advertisement.all.map { advertisementFactory.create(advertisement: $0, application: .shared) }
        viewModels.insert(contentsOf: ads, at: viewModels.count / 2)
    }

    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let viewModel = viewModels[indexPath.item]
        // The cell is dequeued based on the identifier tied to the view model
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.identifier, for: indexPath)
        viewModel.commands[.configuration]?.perform(cell: cell)

        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }

        let viewModel = viewModels[indexPath.item]
        viewModel.commands[.selection]?.perform(cell: cell)
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.item]
        viewModel.commands[.cancellation]?.perform(cell: cell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // The appropriate size is defined by the view model
        return viewModels[indexPath.item].size
    }

}
