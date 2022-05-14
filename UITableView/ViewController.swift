//
//  ViewController.swift
//  UITableView
//
//  Created by Cong Le on 5/12/22.
//

import UIKit
class ViewController: UIViewController {

  private let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return table
  }()

  private let models = [
    "Model S",
    "Model E",
    "Model X",
    "Model Y",
    "Model 3"
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "UITableView"

    navigationController?.navigationBar.backgroundColor = .green

    setupTableView()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

  func setupTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = .systemBackground

    setupTableViewHeader()

    tableView.dataSource = self
    tableView.delegate = self
  }

  private func setupTableViewHeader() {
    let header = HeaderView(frame: .zero)
    
    // Set frame size before populate view to have initial size
    var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    size.width = UIScreen.main.bounds.width
    header.frame.size = size

    // Recalculate header size after populated with content
    size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    size.width = UIScreen.main.bounds.width
    header.frame.size = size

    tableView.tableHeaderView = header
  }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    cell.textLabel?.text = models[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

}
