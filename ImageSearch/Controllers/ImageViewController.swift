//
//  ImageViewController.swift
//  ImageSearch
//
//  Created by Владислав on 25.11.2020.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var images: [UIImage?] = [
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "xmark"),
        UIImage(systemName: "circle.fill"),
        UIImage(systemName: "pencil")
    ]
    
    private let spacing: CGFloat = 20
    private let numberOfItemsPerRow: CGFloat = 3
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

//MARK:- Data Source & Delegate
extension ImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            fatalError("Invalid Cell Kind")
        }
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.configure(with: images[indexPath.row])
        
        return cell
    }
}


//MARK:- Flow Layout
extension ImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width
        let summarySpacing = spacing * (numberOfItemsPerRow - 1)
        let insets = 2 * spacing  // leftInset + rightInset (of section)
        
        let rawWidth = width - summarySpacing - insets
        
        let cellWidth = rawWidth / numberOfItemsPerRow
        
        return CGSize(width: cellWidth, height: cellWidth)
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: spacing,
                     left: spacing,
                     bottom: spacing,
                     right: spacing
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}
