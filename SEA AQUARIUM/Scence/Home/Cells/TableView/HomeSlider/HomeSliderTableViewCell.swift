//
//  HomeSliderTableViewCell.swift
//  SEA AQUARIUM
//
//  Created by Aung Kyaw Mon on 12/10/2567 BE.
//

import UIKit

class HomeSliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewSliders: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    weak var delegate: HomeDetailDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pageControl.numberOfPages = 3
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCells() {
        collectionViewSliders.registerForCells(cells: HomeSliderCollectionViewCell.self)
        collectionViewSliders.dataSource = self
        collectionViewSliders.delegate = self
    }
    
}

extension HomeSliderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReuseCell(type: HomeSliderCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(240))
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToDetail()
    }
    
    
}
