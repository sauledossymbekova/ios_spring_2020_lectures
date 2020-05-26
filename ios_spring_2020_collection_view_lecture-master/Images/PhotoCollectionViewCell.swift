//
//  PhotoCollectionViewCell.swift
//  Images
//
//  Created by erumaru on 4/11/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var url: String? {
        didSet {
            guard let url = url else { return }
            self.downloadImage(url: url)
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    func downloadImage(url: String) {
        loader.startAnimating()
        ImageService.shared.download(url: url) { image in
            self.loader.stopAnimating()
            self.imageView.image = image
        }
    }
}
