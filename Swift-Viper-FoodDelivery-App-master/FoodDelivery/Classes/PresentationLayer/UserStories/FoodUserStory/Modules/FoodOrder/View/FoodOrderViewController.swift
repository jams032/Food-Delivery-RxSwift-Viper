//
//  FoodOrderViewController.swift
//  FoodDelivery
//
//  Created by jamshed alam on 26/08/2020.
//  Copyright © 2017 jamshed alam. All rights reserved.
//

import UIKit
import ViperMcFlurry
import RxDataSources
import RxCocoa
import RxSwift

class FoodOrderViewController: UIViewController, FoodOrderViewInput {

    var output: FoodOrderViewOutput!

    @IBOutlet var tableView: UITableView!

    let disposeBag = DisposeBag()

    let dataSource = RxTableViewSectionedReloadDataSource<ForecastSection>(
            configureCell: { _, tableView, _, item in
                let reuseIdentifier = String(describing: FoodOrderCell.self)
                var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
                if cell == nil {
                    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
                    tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
                }
                if let currentCell = cell as? FoodOrderCell {
                    currentCell.configure(with: item)
                }
                return cell!
            })

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: FoodOrderViewInput
    func setupInitialState(_ city: CityPlainObject) {
        title = city.name
        configureTableView()
    }

    func configureWithItems(_ items: [ForecastPlainObject]) {
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView?.refreshControl?.endRefreshing()
        Observable.just([ForecastSection(items: items.map { forecast in
                    FoodOrderCellObject(name: forecast.day, weather: forecast.name)
                })])
                .bind(to: tableView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)
    }

    private func configureTableView() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func refresh(_ refreshControl: UIRefreshControl) {
        output.didTriggerPullToRefresh()
    }
}
