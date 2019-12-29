//
//  GridIconButton.swift
//  GridlyApp
//

import UIKit

class GridIconButton: UIButton {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gridyButtonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gridyButtonInit()
    }

    private func gridyButtonInit() {
        self.layer.cornerRadius = 8
        Bundle.main.loadNibNamed("GridIconButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = false
    }

    
}
