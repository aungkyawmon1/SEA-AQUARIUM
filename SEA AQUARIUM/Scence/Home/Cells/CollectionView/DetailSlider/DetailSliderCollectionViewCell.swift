//
//  DetailSliderCollectionViewCell.swift
//  SEA AQUARIUM
//
//  Created by Aung Kyaw Mon on 12/10/2567 BE.
//

import UIKit

class DetailSliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ivSlider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ivSlider.clipsToBounds = true
        ivSlider.layer.cornerRadius = 20
        ivSlider.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

}
