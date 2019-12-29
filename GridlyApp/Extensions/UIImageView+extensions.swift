//
//  UIImageView+extensions.swift
//  GridlyApp
//

import UIKit

extension UIImageView {
    
    //creates a blur effect
    func blurView(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(blurView)
    }

    //puts see through hole on a blur view
    func holeInBlur(xPosition: CGFloat, yPosition:CGFloat, width: CGFloat, height: CGFloat) {
        //Add hole to blur view
        let scanLayer = CAShapeLayer()
        //Size of hole
        let scanRect = CGRect.init(x: xPosition, y: yPosition, width: width, height: height)
        let outerPath = UIBezierPath(rect: scanRect)
        let superlayerPath = UIBezierPath.init(rect: self.frame)
        outerPath.append(superlayerPath)
        scanLayer.path = outerPath.cgPath
        scanLayer.fillRule = CAShapeLayerFillRule.evenOdd
        self.layer.mask = scanLayer
    }
    
    

}
