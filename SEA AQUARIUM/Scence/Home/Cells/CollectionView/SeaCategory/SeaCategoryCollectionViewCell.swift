//
//  SeaCategoryCollectionViewCell.swift
//  SEA AQUARIUM
//
//  Created by Aung Kyaw Mon on 12/10/2567 BE.
//

import UIKit

class SeaCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(imageName: String, name: String) {
        lblName.text = name
        ivImage.image = UIImage(named: imageName)
    }

}
