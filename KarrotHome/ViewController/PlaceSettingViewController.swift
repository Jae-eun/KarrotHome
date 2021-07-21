//
//  PlaceSettingViewController.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import UIKit
import SnapKit

protocol PlaceSettingVCDelegate: AnyObject {
    /// 장소 설정 팝업 화면을 닫았을 때 처리
    func dismissPopup()
    /// 사용자 동네 설정 변경했을 때 처리
    func changedMyPlace()
}

final class PlaceSettingViewController: UIViewController {

    // MARK: - UIComponent

    private let backView: UIView = UIView()
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 70
        $0.setCornerRadius(4)
        $0.isScrollEnabled = false
        $0.registerCell(withType: UITableViewCell.self)
        $0.tableFooterView = UIView(frame: .zero)
    }

    // MARK: - Property

    weak var delegate: PlaceSettingVCDelegate?
    private var places: [String] = []
    private var topAnchor: CGFloat?

    // MARK: - Initialize

    init(_ topAnchor: CGFloat) {
        super.init(nibName: nil, bundle: nil)

        self.topAnchor = topAnchor
        setPlacesData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addTapGesture()
    }

    // MARK: - Function

    private func setupUI() {
        view.addSubview(backView)
        view.addSubview(tableView)
        backView.backgroundColor = .black.withAlphaComponent(0.3)
        setConstraint()
    }

    private func setConstraint() {
        backView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(topAnchor!)
            $0.leading.equalTo(16)
            $0.height.width.equalTo(130)
        }
    }

    /// places 데이터 설정
    private func setPlacesData() {
        UserManager.placesKey.forEach {
            places.append(Place(rawValue: $0)?.name ?? "")
        }
        places.append("내 동네 설정하기")
    }

    /// 화면 탭했을 때 닫는 제스처 추가
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(closePopup))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    /// 화면 닫기 
    @objc func closePopup() {
        delegate?.dismissPopup()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension PlaceSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: UITableViewCell.self,
                                               for: indexPath)
        else {
            return .init()
        }

        let place = places[indexPath.row]

        if place == Place(rawValue: UserManager.currentPlaceKey)?.name {
            cell.textLabel?.textColor = .label
        } else {
            cell.textLabel?.textColor = .gray
        }
        cell.textLabel?.font = .boldSystemFont(ofSize: 12)
        cell.textLabel?.text = place

        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlaceSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != places.count - 1 {
            UserManager.currentPlaceKey = UserManager.placesKey[indexPath.row]
            delegate?.changedMyPlace()
        }
        closePopup()
    }
}
