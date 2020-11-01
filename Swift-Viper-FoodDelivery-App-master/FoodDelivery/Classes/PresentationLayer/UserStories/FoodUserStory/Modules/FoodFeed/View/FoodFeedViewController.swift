//
//  FoodDeliveryFeedFoodFeedViewController.swift
//  FoodDelivery
//
//  Created by jamshed alam on 24/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class FoodFeedViewController: UIViewController, FoodFeedViewInput, UISearchBarDelegate {

    @IBOutlet var tableView: UITableView!

    var output: FoodFeedViewOutput!

    let dataSource = RxTableViewSectionedReloadDataSource<FoodFeedSection>(
            configureCell: { _, tableView, _, item in
                let reuseIdentifier = String(describing: FoodFeedCell.self)
                var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
                if cell == nil {
                    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
                    tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
                }
                if let currentCell = cell as? FoodFeedCell {
                    currentCell.configure(with: item)
                }
              //  cell?.frame = cell?.frame as! CGRect
               // cell?.frame.size.height = 120
                return cell!
            })

    var disposeBag = DisposeBag()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.didTriggerViewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.didTriggerViewWillDisappear()
    }

    // MARK: FoodFeedViewInput
    func setupInitialState() {
        configureTableView()
    }

    private func configureTableView() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func refresh(_ refreshControl: UIRefreshControl) {
        output.didTriggerPullToRefresh()
    }

    func configureWithItems(items: [FoodFeedCellObject]) {
        disposeBag = DisposeBag() //Cancel item select subscribe
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView?.refreshControl?.endRefreshing()
        Observable.just([FoodFeedSection(items: items)])
                .bind(to: tableView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)
        tableView.rx.modelSelected(FoodFeedCellObject.self)
                .subscribe(onNext: { [weak self] item in
                    self?.output.didTapCity(item.city)
                    if let index = self?.tableView.indexPathForSelectedRow {
                      //  self?.tableView.deselectRow(at: index, animated: true)
                    }
                })
                .disposed(by: disposeBag)

    }

    // MARK: UISearchBarDelegate

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        output.didTriggerSearchEvent("")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output.didTriggerSearchEvent(searchText)
    }

}

extension FoodFeedViewController: UITableViewDelegate {

    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120 // But we have to return actual value here :(
    }

}
