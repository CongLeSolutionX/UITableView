//
//  SectionFooterView.swift
//  SectionFooterView
//
//  Created by Cong Le on 5/12/22.
//

import UIKit

class SectionFooterView: UIView {
  private let label: UILabel = {
    let label = UILabel()
    label.text = "SectionFooter"
    label.font = .systemFont(ofSize: 22, weight: .semibold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .green
    commonInit()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 104)
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
