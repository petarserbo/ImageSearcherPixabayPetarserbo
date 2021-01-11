//
//  ImageCell.swift
//  ImageSearch
//
//  Created by Владислав on 25.11.2020.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
    
}
