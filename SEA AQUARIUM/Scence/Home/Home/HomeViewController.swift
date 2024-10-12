//
//  HomeViewController.swift
//  SEA AQUARIUM
//
//  Created by Aung Kyaw Mon on 12/10/2567 BE.
//

import UIKit

class HomeViewController: UIViewController, HomeDetailDelegate {

    
    @IBOutlet weak var tableViewHome: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        printStatement(getNumber() == 7)
        
        // Do any additional setup after loading the view.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.titleView = CustomTitle(frame: .zero)
        
        setupNoti()
        
        registerTableCells()
    }
    
    
    func getNumber() -> Int {
        print("Fetching number...")
        print("Hello")
        return 5
    }


    func printStatement(_ result: @autoclosure () -> Bool) {
        // print("Here is the number: \(result())")
        print("Nothing to see here.")
    }


    
    func setupNoti() {
        let notiButtonItem = UIBarButtonItem(image: UIImage(named: "ic_noti")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onTapNoti))
        navigationItem.rightBarButtonItem = notiButtonItem
        
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onTapNoti))
        navigationItem.leftBarButtonItem = backButtonItem
    }
    
    @objc func onTapNoti() {
        
    }
    
    func registerTableCells() {
        
        tableViewHome.dataSource = self
        tableViewHome.delegate = self
        tableViewHome.registerForCells(cells: [
            HomeSliderTableViewCell.self,
            SeaCategoryTableViewCell.self,
            UpComingTableViewCell.self])
    }


    func navigateToDetail() {
        let vc = DetailViewController()
        vc.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        self.present(vc, animated: false, completion: nil)
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeReuseCell(type: HomeSliderTableViewCell.self, indexPath: indexPath)
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeReuseCell(type: SeaCategoryTableViewCell.self, indexPath: indexPath)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeReuseCell(type: UpComingTableViewCell.self, indexPath: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
