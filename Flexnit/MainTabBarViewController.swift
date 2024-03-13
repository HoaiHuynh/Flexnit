//
//  ViewController.swift
//  Flexnit
//
//  Created by Huynh Van Hoai on 13/03/2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upcomingVC = UINavigationController(rootViewController: UpComingViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let downloadsVC = UINavigationController(rootViewController: DownloadsViewController())

        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.title = "Home"

        upcomingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        upcomingVC.title = "Coming"

        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.title = "Top Search"

        downloadsVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line.compact")
        downloadsVC.title = "Downloads"

        tabBar.tintColor = .label

        setViewControllers([homeVC, upcomingVC, searchVC, downloadsVC], animated: true)
    }
}
