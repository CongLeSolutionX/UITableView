//
//  TableHeaderSectionView.swift
//  TableHeaderSectionView
//
//  Created by Cong Le on 5/12/22.
//

import UIKit

class HeaderView: UIView {
  static let identifier = "HeaderView"
  private let label: UILabel = {
    let label = UILabel()
    label.text = "Header"
    label.font = .systemFont(ofSize: 22, weight: .semibold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .orange
    commonInit()
  }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 104)
  }

  func commonInit() {
    addSubview(label)
    setupConstraints()
  }
//  override init(reuseIdentifier: String?) {
//    super.init(reuseIdentifier: reuseIdentifier)
//    contentView.addSubview(label)
//    contentView.backgroundColor = .systemOrange
//    contentView.frame = .zero
//  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: centerXAnchor),
      label.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
