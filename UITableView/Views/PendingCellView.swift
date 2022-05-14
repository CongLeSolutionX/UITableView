//
//  PendingCellView.swift
//  UITableView
//
//  Created by Cong Le on 5/13/22.
//

import UIKit

class PendingCellView: UITableViewCell {
  static let identifier = "PendingCellView"
  
  let amountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(nameLabel)
    contentView.addSubview(amountLabel)
    
    applyConstraints()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func applyConstraints() {
    
    let nameLabelConstraints = [
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ]
    
    let amountLabelContraints = [
      amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
    ]
    NSLayoutConstraint.activate(nameLabelConstraints)
    NSLayoutConstraint.activate(amountLabelContraints)
  }
}
