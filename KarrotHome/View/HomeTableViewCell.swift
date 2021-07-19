//
//  HomeTableViewCell.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/19.
//

import UIKit
import SnapKit
import Then

final class HomeTableViewCell: UITableViewCell {

    // MARK: - UIComponents
    private let productImageView = UIImageView().then {
        $0.layer.cornerRadius = 8
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.isLayoutMarginsRelativeArrangement = true
    }
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 2
    }
    private let infoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    private let priceLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
    }
    private let hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.isLayoutMarginsRelativeArrangement = true
        $0.spacing = 3
    }
    private let commentImageView = UIImageView().then {
        $0.image = UIImage(symbol: SFSymbol.bubbleLeftAndBubbleRight)
        $0.tintColor = .systemGray
    }
    private let commentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .darkGray
    }
    private let likeImageView = UIImageView().then {
        $0.image = UIImage(symbol: SFSymbol.heart)
        $0.tintColor = .systemGray
    }
    private let likeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .darkGray
    }

    // MARK: - Override
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Function
    private func setUI() {
        backgroundColor = .white
        [productImageView, vStackView, hStackView].forEach {
            contentView.addSubview($0)
        }
        [productNameLabel, infoLabel, priceLabel].forEach {
            vStackView.addArrangedSubview($0)
        }
        [commentImageView, commentLabel, likeImageView, likeLabel].forEach {
            hStackView.addArrangedSubview($0)
        }
        setConstraint()
    }

    private func setConstraint() {
        productImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
            $0.width.height.equalTo(contentView.snp.width).dividedBy(3)
        }

        vStackView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.top)
            $0.bottom.greaterThanOrEqualTo(hStackView.snp.top).offset(-16)
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }

        hStackView.snp.makeConstraints {
            $0.bottom.trailing.equalTo(contentView).inset(16)
            $0.height.lessThanOrEqualTo(20)
        }
    }
    
    func configure() {
        productImageView.image = UIImage(named: "IMG_2646")
        productNameLabel.text = "제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목"
        infoLabel.text = "정보정보정보정보정보"
        priceLabel.text = "1,000,000,000원"
        commentLabel.text = "1"
        likeLabel.text = "2"
    }
}
