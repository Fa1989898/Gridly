//
//  SelectedImageViewController.swift
//  GridlyApp
//

import UIKit

class SelectedImageViewController: UIViewController {
    
    @IBOutlet weak var pickedImageView: UIImageView!
    
    public var selectedImage: UIImage?
    public var gridDimension = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        if let selectedImage = selectedImage {
            DispatchQueue.main.async {
                UIView.animate(
                    withDuration: 1,
                    animations: {
                        let backgroundImageView = UIImageView.init(frame: self.view.frame)
                        backgroundImageView.image = selectedImage
                        backgroundImageView.contentMode = .scaleAspectFill
                        backgroundImageView.blurView(style: .dark)
                        self.view.insertSubview(backgroundImageView, at: 0)
                } ,
                    completion: nil
                )
            }
            pickedImageView.image = selectedImage
        }
    }
    
    
    @IBAction func selectImagePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "puzzleImage", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "puzzleImage" {
            let destinationVC = segue.destination as! PuzzleViewController
            destinationVC.puzzleImage = selectedImage
            destinationVC.gridDimension = gridDimension
        }
    }
    
}
