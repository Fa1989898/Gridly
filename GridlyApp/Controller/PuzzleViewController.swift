//
//  PuzzleViewController.swift
//  GridlyApp
//

import UIKit

class PuzzleViewController: UIViewController, UIDropInteractionDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDragDelegate
{
    
    
    public var puzzleImage: UIImage?
    public var gridDimension = 4
    
    private let localImages: [UIImage] = [UIImage(named: "Butterfly")!, UIImage(named: "Fox")!, UIImage(named: "Grizzly")!, UIImage(named: "Macao")!, UIImage(named: "Rhinoceros")!]
    
  //original collection view
    @IBOutlet weak var gridedImageCV: UICollectionView! {
        didSet {
            gridedImageCV.dataSource = self
            gridedImageCV.delegate = self
            gridedImageCV.dragDelegate = self
        }
    }
    
    //target collection view
    @IBOutlet weak var resetImageCV: UICollectionView! {
        didSet {
            resetImageCV.addInteraction(UIDropInteraction(delegate: self))
            resetImageCV.dataSource = self
            resetImageCV.delegate = self
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return localImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridedImageCell", for: indexPath)
        //
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return dragItems(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        return dragItems(at: indexPath)
    }
    
    private func dragItems(at indexPath: IndexPath) -> [UIDragItem] {
        if let attributedImage = (gridedImageCV.cellForItem(at: indexPath) as? GridedImageCollectionViewCell )?.view.attributedIma
    }
    
    
    
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: UIImage.self) { images in }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For now just split the image into 16 tiles
        if let puzzleImage = puzzleImage {
            print("main image width: \(puzzleImage.size.width) and height: \(puzzleImage.size.height)")
            let imageDict = puzzleImage.splitImage(4).shuffled()
            var images = [UIImage]()
            for i in imageDict {
                images.append(i.value)
                print("image width: \(i.value.size.width) and height: \(i.value.size.height)")
            }
        }
    }
    
}







