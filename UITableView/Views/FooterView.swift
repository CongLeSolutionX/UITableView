//
//  FooterView.swift
//  UITableView
//
//  Created by Cong Le on 5/13/22.
//

import UIKit

class FooterView: UIView {

  private let label: UILabel = {
    let label = UILabel()
    label.text = "Footer"
    label.font = .systemFont(ofSize: 22, weight: .semibold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBlue
    commonInit()
  }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 104)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func commonInit() {
    addSubview(label)
    setupConstraints()
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: centerXAnchor),
      label.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
