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
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    return table
  }()

  var viewModel: TransactionViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "UITableView"

    navigationController?.navigationBar.backgroundColor = .green

    setupTableView()

    fetchData()
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

  private func fetchData() {
    let tx1 = Transaction(firstName: "Cong", lastname: "Le", amount: "100.00", type: .pending)
    let tx2 = Transaction(firstName: "Kevin", lastname: "Nguyen", amount: "1000.00", type: .pending)
    let tx3 = Transaction(firstName: "Ed", lastname: "Hoang", amount: "900.00", type: .pending)
    let tx4 = Transaction(firstName: "Victor", lastname: "Ngo", amount: "890.00", type: .pending)
    let tx5 = Transaction(firstName: "Henrick", lastname: "Vu", amount: "89000.00", type: .pending)

    let tx6 = Transaction(firstName: "Ngo", lastname: "Cuong", amount: "980.00", type: .posted)
    let tx7 = Transaction(firstName: "Loc", lastname: "Dao", amount: "1090.00", type: .posted)
    let tx8 = Transaction(firstName: "Vu", lastname: "Ho", amount: "800.00", type: .posted)
    let tx9 = Transaction(firstName: "Nguyen", lastname: "Nguyen", amount: "910.00", type: .posted)
    let tx10 = Transaction(firstName: "An", lastname: "Nguyen", amount: "8900.00", type: .posted)

    let section1 = TransactionSection(title: "Pending transfers", transactions: [tx1,tx2,tx3,tx4,tx5])
    let section2 = TransactionSection(title: "Posted transfers", transactions: [tx6,tx7,tx8,tx9,tx10])

    viewModel = TransactionViewModel(sections: [section1, section2])
  }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let viewModel = viewModel else { return 0 }
    return viewModel.sections[section].transactions.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let viewModel = viewModel else { return UITableViewCell() }

    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    let section = indexPath.section

    let amountText = viewModel.sections[section].transactions[indexPath.row].amount
    cell.textLabel?.text = amountText

    return cell
  }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let viewModel = viewModel else { return nil }
    return viewModel.sections[section].title
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    guard let sections = viewModel?.sections else { return 0 }
    return sections.count
  }
}
