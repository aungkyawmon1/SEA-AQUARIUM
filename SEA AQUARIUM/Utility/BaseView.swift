//
//  BaseView.swift
//  SEA AQUARIUM
//
//  Created by Aung Kyaw Mon on 12/10/2567 BE.
//
import UIKit

class BaseView : UIView {
    
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTest()
        setupLanguae()
        bindData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupTest()
        setupLanguae()
        bindData()
    }
    
    func setupLanguae(){
        
    }
    
    func bindData(){
        
    }
    
    func setupUI() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView! {
        return UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView ?? UIView(frame: CGRect.zero)
    }
    
    func setupTest() {
        
    }

}
