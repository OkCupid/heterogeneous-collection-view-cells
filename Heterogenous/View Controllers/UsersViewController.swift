//
//  UsersViewController.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/16/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    var viewModels = [CollectionViewCellViewModelProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModels()
    }
    
    private func setupViewModels() {
        do {
            let userListItems: [AnyUserListItem] = try JSONDecoder().decodeFixture(name: "user_list_items")
            self.viewModels = userListItems.map({ AnyUserListItemFactory(userListItem: $0, viewController: self).create() })
        } catch {

        }
    }
}

extension UsersViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModels[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.identifier, for: indexPath)
        viewModel.commands[.configuration]?.perform(arguments: [.cell: cell])
        return cell
    }

}

extension UsersViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }

        let viewModel = viewModels[indexPath.item]
        viewModel.commands[.selection]?.perform(arguments: [.cell: cell])
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.item]
        viewModel.commands[.cancellation]?.perform(arguments: [.cell: cell])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModels[indexPath.item].size
    }

}
