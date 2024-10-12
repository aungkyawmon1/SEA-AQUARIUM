//
//  DetailViewController.swift
//  SEA AQUARIUM
//
//  Created by Aung Kyaw Mon on 12/10/2567 BE.
//

import UIKit


protocol HomeDetailDelegate: AnyObject {
    func navigateToDetail()
}

class DetailViewController: UIViewController {
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var ivClose: UIImageView!
    @IBOutlet weak var collectionViewSliders: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        setupGesture()
        
        registerCells()
    }
    
    func registerCells() {
        collectionViewSliders.registerForCells(cells: DetailSliderCollectionViewCell.self)
        collectionViewSliders.dataSource = self
        collectionViewSliders.delegate = self
    }
    
    func setupGesture() {
        let tapClose = UITapGestureRecognizer(target: self, action: #selector(onTapClose))
        ivClose.addGestureRecognizer(tapClose)
        ivClose.isUserInteractionEnabled = true
    }
    
    @objc func onTapClose() {
        self.dismiss(animated: true)
    }


    func setupUI() {
        distanceView.layer.borderWidth = 1
        distanceView.layer.borderColor = UIColor.gray.cgColor
        distanceView.layer.cornerRadius = 8
    }

}


extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReuseCell(type: DetailSliderCollectionViewCell.self, indexPath: indexPath)
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
        
    }
    
    

}
