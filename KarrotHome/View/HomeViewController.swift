//
//  HomeViewController.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/19.
//

import UIKit
import Then

final class HomeViewController: UIViewController {

    // MARK: - UIComponent
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 180
        $0.refreshControl = UIRefreshControl()
        $0.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        $0.refreshControl?.tintColor = .karrotMain
        $0.registerCell(withType: HomeTableViewCell.self)
        $0.tableFooterView = UIView(frame: .zero)
    }
    private lazy var shadowView = UIView().then {
        $0.setShadow(opacity: 0.2, offSet: CGSize(width: 1, height: 3), radius: 2)
        $0.isUserInteractionEnabled = false
    }
    private lazy var floatingButton = UIButton().then {
        $0.setImage(UIImage(symbol: .plus), for: .normal)
        $0.backgroundColor = .karrotMain
        $0.tintColor = .white
        $0.setCornerRadius(30)
    }
    private lazy var leftBarButton = UIButton().then {
        $0.setTitle(Place(rawValue: UserManager.currentPlaceKey)?.name, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 17)
        $0.setTitleColor(.label, for: .normal)
        $0.setImage(UIImage(symbol: .chevronDown), for: .normal)
        $0.contentEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 8)
        $0.imageEdgeInsets = .init(top: 0, left: -8, bottom: 0, right: 0)
        $0.addTarget(self, action: #selector(movePlaceSettingView), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var languageButton
        = UIBarButtonItem(image: UIImage(symbol: .textformatSizeLarger),
                          style: .plain,
                          target: self,
                          action: #selector(moveLanguageSettingVC))
    private lazy var  searchBarButton = UIBarButtonItem().then {
        $0.image = UIImage(symbol: .magnifyingglass)
    }
    private lazy var  categoryBarButton = UIBarButtonItem().then {
        $0.image = UIImage(symbol: .listDash)
    }
    private lazy var  noticeBarButton = UIBarButtonItem().then {
        $0.image = UIImage(symbol: .bell)
    }

    // MARK: - Property
    private let homeService = HomeService()
    private var products: [Product] = []

    // MARK: - Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setNavigation()
        products = homeService.fetchProductList(UserManager.currentPlaceKey)
    }

    // MARK: - Function
    private func setupUI() {
        self.view.addSubview(tableView)
        self.shadowView.addSubview(floatingButton)
        self.view.addSubview(shadowView)
        tableView.backgroundColor = .systemBackground

        setConstraint()
    }

    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        floatingButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.width.height.equalTo(60)
        }
    }

    private func setNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .label
        let stackView = UIStackView
            .appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        stackView.spacing = -10
        setRightBarButtonItem()
        setLeftBarButtonItem()
    }

    private func setLeftBarButtonItem() {
        let leftBarButton = UIBarButtonItem(customView: leftBarButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }

    private func setRightBarButtonItem() {
        self.navigationItem.rightBarButtonItems = [noticeBarButton, categoryBarButton,
                                                   searchBarButton, languageButton]
    }

    /// 동네 선택하는 뷰 표시
    @objc private func movePlaceSettingView() {
        rotateLeftBarButton(.pi)

        let placeSettingVC = PlaceSettingViewController(topHeight - 2)
        placeSettingVC.modalPresentationStyle = .overCurrentContext
        placeSettingVC.modalTransitionStyle = .crossDissolve
        placeSettingVC.delegate = self
        present(placeSettingVC, animated: true, completion: nil)
    }

    /// 네비 왼쪽 바버튼(동네 오른쪽 이미지v) 회전
    private func rotateLeftBarButton(_ angle: CGFloat) {
        UIView.animate(withDuration: 0.25) {
            self.leftBarButton.imageView?.transform = CGAffineTransform(rotationAngle: angle)
        }
    }

    /// 플로팅 + 버튼 회전
    @objc private func rotateFloatingButton() {
        UIView.animate(withDuration: 0.5) {
            self.floatingButton.transform = CGAffineTransform(rotationAngle: .pi * 0.25)
        }
        floatingButton.tintColor = .karrotMain
        floatingButton.backgroundColor = .yellow
    }

    /// 테이블뷰 위로 당길 때 리로드
    @objc private func pullToRefresh(_ sender: UIRefreshControl) {
        sender.endRefreshing()
        products = homeService.fetchProductList(UserManager.currentPlaceKey)
        tableView.reloadData()
    }

    /// 언어 설정 화면으로 이동
    @objc func moveLanguageSettingVC() {
        let languageSettingVC = LanguageSettingViewController()
        languageSettingVC.delegate = self
        self.navigationController?.pushViewController(languageSettingVC, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: HomeTableViewCell.self,
                                               for: indexPath) as? HomeTableViewCell
        else {
            return .init()
        }
        cell.configure(products[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - LanguageSettingVCDelegate

extension HomeViewController: LanguageSettingVCDelegate {
    func changedLanguageSetting() {
        tableView.reloadData()
    }
}

// MARK: - PlaceSettingVCDelegate

extension HomeViewController: PlaceSettingVCDelegate {
    func dismissPopup() {
        rotateLeftBarButton(.pi * 2)
    }

    func changedMyPlace() {
        leftBarButton.setTitle(Place(rawValue: UserManager.currentPlaceKey)?.name,
                               for: .normal)
        leftBarButton.titleLabel?.sizeToFit()

        products = homeService.fetchProductList(UserManager.currentPlaceKey)
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                              at: .top,
                              animated: true)
        tableView.reloadData()
    }
}
