//
//  PostedCellView.swift
//  UITableView
//
//  Created by Cong Le on 5/14/22.
//

import UIKit

class PostedCellView: UITableViewCell {
  static let identifier = "PostedCellView"

  let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let amountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let typeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .red
    contentView.addSubview(nameLabel)
    contentView.addSubview(amountLabel)
    contentView.addSubview(typeLabel)

    applyConstraints()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func applyConstraints() {
    let typeLabelContraints = [
      typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ]

    let nameLabelConstraints = [
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 20)
    ]

    let amountLabelContraints = [
      amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
    ]

    NSLayoutConstraint.activate(typeLabelContraints)
    NSLayoutConstraint.activate(nameLabelConstraints)
    NSLayoutConstraint.activate(amountLabelContraints)
  }
}
