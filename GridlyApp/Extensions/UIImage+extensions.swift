//
//  UIImage+extensions.swift
//  GridlyApp
//

import UIKit

extension UIImage {

    //splits image
    func splitImage(_ gridDimension: Int) -> [Int : UIImage] {
        let y = scale * (size.height / CGFloat(gridDimension))
        let x = scale * (size.width / CGFloat(gridDimension))
        var images = [Int : UIImage]()
        images.reserveCapacity(gridDimension * gridDimension)
        guard let cgImage = cgImage else { return [:] }

        (0..<gridDimension).forEach { row in
            (0..<gridDimension).forEach { column in
                var width = Int(x)
                var height = Int(y)
                if row == gridDimension-1 && size.height.truncatingRemainder(dividingBy: CGFloat(gridDimension)) != 0 {
                    height = Int(scale * (size.height - size.height / CGFloat(gridDimension) * (CGFloat(gridDimension)-1)))
                }
                if column == gridDimension-1 && size.width.truncatingRemainder(dividingBy: CGFloat(gridDimension)) != 0 {
                    width = Int(scale * (size.width - (size.width / CGFloat(gridDimension) * (CGFloat(gridDimension)-1))))
                }
                if let image = cgImage.cropping(to: CGRect(origin: CGPoint(x: column * Int(x), y:  row * Int(x)), size: CGSize(width: width, height: height))) {
                    images[images.count] = UIImage(cgImage: image, scale: scale, orientation: imageOrientation)
                }
            }
        }

        return images
    }
}

