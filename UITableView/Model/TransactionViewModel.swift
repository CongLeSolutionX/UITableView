//
//  TransactionViewModel.swift
//  UITableView
//
//  Created by Cong Le on 5/13/22.
//

import Foundation

struct TransactionViewModel {
  let sections: [TransactionSection]
}

struct TransactionSection  {
  let title: String
  let transactions: [Transaction]
}

struct Transaction {
  let firstName: String
  let lastname: String
  let amount: String
  let type: TransationType
}

enum TransationType: String {
  case pending = "Pending"
  case posted = "Posted "
}
