//
//  ViewController.swift
//  UITableView
//
//  Created by Cong Le on 5/12/22.
//

import UIKit
class ViewController: UIViewController {

  private let tableView: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    //table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId") // default TableViewCell
    table.register(PendingCellView.self, forCellReuseIdentifier: PendingCellView.identifier)
    table.register(PostedCellView.self, forCellReuseIdentifier: PostedCellView.identifier)
    if #available(iOS 15, *) {
      // Close the gap between the Header view and section header view
      table.sectionHeaderTopPadding = 0
    }
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
    tableView.frame = view.bounds // Otherwise, we need to do AutoLayout manually for this
  }

  private func setupTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = .systemBackground

    setupTableViewHeader()
    setupTableViewFooter()

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

  private func setupTableViewFooter() {
    let footer = FooterView(frame: .zero)

    // Set frame size before populate view to have initial size
    var size = footer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    size.width = UIScreen.main.bounds.width
    footer.frame.size = size

    // Recalculate header size after populated with content
    size = footer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    size.width = UIScreen.main.bounds.width
    footer.frame.size = size

    tableView.tableFooterView = footer
  }

  private func fetchData() {
    let tx1 = Transaction(firstName: "Cong", lastName: "Le", amount: "100.00", type: .pending)
    let tx2 = Transaction(firstName: "Kevin", lastName: "Nguyen", amount: "1000.00", type: .pending)
    let tx3 = Transaction(firstName: "Ed", lastName: "Hoang", amount: "900.00", type: .pending)
    let tx4 = Transaction(firstName: "Victor", lastName: "Ngo", amount: "890.00", type: .pending)
    let tx5 = Transaction(firstName: "Henrick", lastName: "Vu", amount: "89000.00", type: .pending)

    let tx6 = Transaction(firstName: "Ngo", lastName: "Cuong", amount: "980.00", type: .posted)
    let tx7 = Transaction(firstName: "Loc", lastName: "Dao", amount: "1090.00", type: .posted)
    let tx8 = Transaction(firstName: "Vu", lastName: "Ho", amount: "800.00", type: .posted)
    let tx9 = Transaction(firstName: "Nguyen", lastName: "Nguyen", amount: "910.00", type: .posted)
    let tx10 = Transaction(firstName: "An", lastName: "Nguyen", amount: "8900.00", type: .posted)

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

    //let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) // default tableViewCell
    let section = indexPath.section
    let transaction = viewModel.sections[section].transactions[indexPath.row]
    let fullName = "\(transaction.firstName) \(transaction.lastName)"
    let amountText = transaction.amount
    let transactionType = transaction.type

    switch transactionType {
    case .pending:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: PendingCellView.identifier, for: indexPath) as? PendingCellView else { return UITableViewCell() }

      cell.nameLabel.text = fullName
      cell.amountLabel.text = amountText
      return cell
    case .posted:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: PostedCellView.identifier, for: indexPath) as? PostedCellView else { return UITableViewCell() }
      cell.typeLabel.text = transactionType.rawValue
      cell.nameLabel.text = fullName
      cell.amountLabel.text = amountText
      return cell
    }
  }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
  // Default Section Header View
  //  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
  //    guard let viewModel = viewModel else { return nil }
  //    return viewModel.sections[section].title
  //  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = SectionHeaderView(frame: .zero)
    return header
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 70
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    guard let sections = viewModel?.sections else { return 0 }
    return sections.count
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footerView = SectionFooterView(frame: .zero)
    return footerView
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 40
  }
}
