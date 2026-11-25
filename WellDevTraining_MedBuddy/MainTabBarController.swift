import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let dashboardViewController = DashboardViewController()
        let medicinesViewController = MedicinesViewController()
        let calendarViewController = CalendarViewController()
        let profileViewController = ProfileViewController()
        
        let dashboardNav = UINavigationController(rootViewController: dashboardViewController)
        dashboardNav.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let medicinesNav = UINavigationController(rootViewController: medicinesViewController)
        medicinesNav.tabBarItem = UITabBarItem(
            title: "Medicines",
            image: UIImage(systemName: "pills"),
            selectedImage: UIImage(systemName: "pills.fill")
        )
        
        let calendarNav = UINavigationController(rootViewController: calendarViewController)
        calendarNav.tabBarItem = UITabBarItem(
            title: "Calendar",
            image: UIImage(systemName: "calendar"),
            selectedImage: UIImage(systemName: "calendar")
        )
        
        let profileNav = UINavigationController(rootViewController: profileViewController)
        profileNav.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        setViewControllers([dashboardNav, medicinesNav, calendarNav, profileNav], animated: true)
    }
}
