//
//  CartTableViewController.swift
//  ios-shoppe-demo
//
//  Created on 4/7/20.
//  Copyright © 2020 FullStory All rights reserved.
//

import Foundation
import UIKit

var order: Order = Order()
var user: UserProfile = UserProfile(addressDetail: [.email:"user1@example.com"])

class CartTableViewController: UITableViewController {

    var items = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.TitleStrings.orderCart
        navigationController?.navigationBar.tintColor = .white
        
        registerCells(tableView: tableView, registry: Registry.cartTableView)

        setOrderItemsForCart()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor().fsBackground()
    }

    func setOrderItemsForCart() {
        items = order.items.filter { $0.quantity > 0 }
    }

    func presentCheckout() {
        self.navigationController?.pushViewController(CheckoutTableViewController(), animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (items.count == 0) ? 1 : 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return (items.count == 0) ? 1 : items.count
        default:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if (items.count == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.title, for: indexPath) as? LargeLabelTableViewCell
            cell?.largeTextLabel.text = "No items in Cart."
            cell?.largeTextLabel.textAlignment = .center

            return cell ?? UITableViewCell()
        } else {
            switch indexPath.section {
            case 0:
                let cell =  tableView.dequeueReusableCell(withIdentifier: CellID.checkout) as? CartTableViewCell

                cell?.cartTableViewController = self
                cell?.setup()

                return cell ?? UITableViewCell()
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.title, for: indexPath) as? LargeLabelTableViewCell
                cell?.largeTextLabel.text = "Products In Cart:"

                return cell ?? UITableViewCell()
            case 2:
                let product = items[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.quantity, for: indexPath) as? CartQuantityTableViewCell

                cell?.product = product
                cell?.tableViewController = self

                return cell ?? UITableViewCell()
            default:
                return UITableViewCell()
            }
        }
    }
}
