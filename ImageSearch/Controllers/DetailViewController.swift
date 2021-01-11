//
//  DetailViewController.swift
//  ImageSearchProjectPetar
//
//  Created by Petar Perich on 14.12.2020.
//

import UIKit



class DetailViewController: UIViewController {
    
    @IBOutlet private weak var detaiilImage: UIImageView!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    var myImage: ImageInfo!
    var imageDownloads: ImageInfo!
    var imageLikes: ImageInfo!
    var imageViews: ImageInfo!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure () {
        detaiilImage.load(url: myImage.webformatURL!)
        likesLabel.text = "\(imageLikes.likes) ❤️"
        viewsLabel.text = "\(imageViews.views) 👀"
        downloadsLabel.text = "\(imageDownloads.downloads) 💾"
        
     

    }
}

//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}


extension UIImageView {
    func load (url: URL) {
        NetworkService.shared.loadImage(from: url) { [weak self] (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
