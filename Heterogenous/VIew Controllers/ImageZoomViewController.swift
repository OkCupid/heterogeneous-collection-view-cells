//
//  UserProfileViewController.swift
//  Heterogenous
//
//  Created by Julian Tejera-Frias on 10/17/17.
//  Copyright © 2017 OkCupid. All rights reserved.
//

import UIKit

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.backgroundColor = .black
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.2
            scrollView.maximumZoomScale = 3.0
        }
    }
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .center
        }
    }

    var username: String?
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = username
        imageView.image = image
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
