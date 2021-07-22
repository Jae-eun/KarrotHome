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

    // MARK: - UIComponent
    private let productImageView = UIImageView().then {
        $0.setCornerRadius(8)
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .systemGray6
    }
    private let vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.isLayoutMarginsRelativeArrangement = true
        $0.spacing = 5
    }
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byCharWrapping
    }
    private let infoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
        $0.numberOfLines = 2
        $0.lineBreakMode = .byCharWrapping
    }
    private let hPriceStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.isLayoutMarginsRelativeArrangement = true
        $0.spacing = 5
    }
    private let stateLabel = UILabel().then {
        $0.backgroundColor = .karrotGreen
        $0.setCornerRadius(3)
        $0.font = .boldSystemFont(ofSize: 11)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    private let priceLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 17)
    }
    private let hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.isLayoutMarginsRelativeArrangement = true
        $0.spacing = 3
    }
    private let commentImageView = UIImageView().then {
        $0.image = UIImage(symbol: .bubbleLeftAndBubbleRight)
        $0.tintColor = .systemGray
    }
    private let commentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .darkGray
    }
    private let likeImageView = UIImageView().then {
        $0.image = UIImage(symbol: .heart)
        $0.tintColor = .systemGray
    }
    private let likeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .darkGray
    }

    // MARK: - Property
    private var imageLoadTask: URLSessionTask?

    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        productImageView.image = nil
        self.imageLoadTask?.cancel()
        productNameLabel.text = ""
        infoLabel.text = ""
        stateLabel.isHidden = false
        priceLabel.text = ""
        commentImageView.isHidden = false
        commentLabel.text = ""
        likeImageView.isHidden = false
        likeLabel.text = ""
        contentView.layer.opacity = 1.0
    }

    // MARK: - Function

    private func setUI() {
        self.selectionStyle = .none
        [productImageView, vStackView, hStackView].forEach {
            contentView.addSubview($0)
        }
        [stateLabel, priceLabel].forEach {
            hPriceStackView.addArrangedSubview($0)
        }
        [productNameLabel, infoLabel, hPriceStackView].forEach {
            vStackView.addArrangedSubview($0)
        }
        [commentImageView, commentLabel, likeImageView, likeLabel].forEach {
            hStackView.addArrangedSubview($0)
        }
        setConstraint()
    }

    private func setConstraint() {
        productImageView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView).inset(16)
            $0.bottom.equalTo(contentView).inset(16).priority(.medium)
            $0.width.height.equalTo(contentView.snp.width).dividedBy(3)
        }
        vStackView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.top)
            $0.bottom.lessThanOrEqualTo(productImageView.snp.bottom).offset(-32)
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        hStackView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(vStackView.snp.bottom).offset(8)
            $0.bottom.trailing.equalTo(contentView).inset(16)
        }
    }

    /// 셀 데이터 넣기 
    func configure(_ product: Product) {
        imageLoadTask = productImageView.loadImage(with: product.imageUrl)
        productNameLabel.text = product.title
        setInfoLabel(product.address, product.isNew, product.postingTime)
        setStateLabel(product.state)
        priceLabel.text = "\(product.price.formattedPriceWithSeparator)"
        setCommentLabel(product.commentCount)
        setLikeLabel(product.likeCount)
    }

    /// 장소, 게시 시간 정보 레이블 설정
    private func setInfoLabel(_ address: String,
                              _ isNew: Bool,
                              _ postingTime: Date) {
        let boosted = !isNew ? "Boosted".localized : ""
        infoLabel.text = "\(address) · \(boosted) \(postingTime.relativeDate())"
    }

    /// 판매 상태 레이블 설정
    private func setStateLabel(_ state: SaleState) {
        switch state {
        case .sale:
            stateLabel.isHidden = true
        case .reserved:
            stateLabel.backgroundColor = .karrotGreen
            stateLabel.text = state.localizedDescription
        case .sold:
            stateLabel.text = state.localizedDescription
            stateLabel.backgroundColor = .gray
            self.contentView.layer.opacity = 0.5
        }
    }

    /// 댓글 아이콘, 레이블 설정
    private func setCommentLabel(_ commentCount: Int?) {
        if let commentCount = commentCount {
            commentLabel.text = "\(commentCount)"
        } else {
            commentImageView.isHidden = true
        }
    }

    /// 좋아요 아이콘, 레이블 설정
    private func setLikeLabel(_ likeCount: Int?) {
        if let likeCount = likeCount {
            likeLabel.text = "\(likeCount)"
        } else {
            likeImageView.isHidden = true
        }
    }
}
