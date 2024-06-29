

import UIKit

final class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let airTicketsViewController = createNavController(vc: AirTicketsViewController(), itemName: Resources.TabBar.Name.airTicketsViewController, itemImage: Resources.TabBar.Image.airTicketsViewController)
        let hotelsViewController = createNavController(vc: HotelsViewController(), itemName: Resources.TabBar.Name.hotelsViewController, itemImage: Resources.TabBar.Image.hotelsViewController)
        let shortWayViewController = createNavController(vc: ShortWayViewController(), itemName: Resources.TabBar.Name.shortWayViewController, itemImage: Resources.TabBar.Image.shortWayViewController)
        let subscriptionsViewController = createNavController(vc: SubscriptionsViewController(), itemName: Resources.TabBar.Name.subscriptionsViewController, itemImage: Resources.TabBar.Image.subscriptionsViewController)
        let profileViewController = createNavController(vc: ProfileViewController(), itemName: Resources.TabBar.Name.profileViewController, itemImage: Resources.TabBar.Image.profileViewController)

        
        
        setViewControllers([airTicketsViewController, hotelsViewController,shortWayViewController,subscriptionsViewController,profileViewController], animated: false)
        
    }
    
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(named: itemImage)?.withAlignmentRectInsets(.init(top: 10,
                                                       left: 0,
                                                       bottom: 0,
                                                       right: 0)), tag: 0)
        
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
        
    }
}

