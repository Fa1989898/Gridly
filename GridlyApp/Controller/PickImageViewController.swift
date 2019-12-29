//
//  ViewController.swift
//  GridlyApp
//

import UIKit

class PickImageViewController: UIViewController {

    @IBOutlet weak var gridPick: GridIconButton!
    @IBOutlet weak var cameraPick: GridIconButton!
    @IBOutlet weak var libraryPick: GridIconButton!
    
    private var pickedImage: UIImage?
    
    private let localImages: [UIImage] = [UIImage(named: "Butterfly")!, UIImage(named: "Fox")!, UIImage(named: "Grizzly")!, UIImage(named: "Macao")!, UIImage(named: "Rhinoceros")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Grid pick
        gridPick.iconLabel.text = "Pick"
        gridPick.iconImageView.image = UIImage(named: "Gridy-name-small-grey")
        
        // Camera pick
        cameraPick.iconLabel.text = "Camera"
        cameraPick.iconImageView.image = UIImage(named: "Gridy-camera")
        
        // Library pick
        libraryPick.iconLabel.text = "Library"
        libraryPick.iconImageView.image = UIImage(named: "Gridy-library")
    }

    @IBAction func pickButtonPressed(_ sender: Any) {
        let randomIndex = Int.random(in: 0..<localImages.count)
        pickedImage = localImages[randomIndex]
        self.performSegue(withIdentifier: "selectedImage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedImage" {
            let destinationVC = segue.destination as! SelectedImageViewController
            destinationVC.selectedImage = pickedImage
        }
    }
    
}

