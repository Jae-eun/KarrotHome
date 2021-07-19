//
//  HomeViewController.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/19.
//

import UIKit
import Then

final class HomeViewController: UIViewController {

    // MARK: - UIComponents
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 180
        $0.registerCell(withType: HomeTableViewCell.self)
        $0.tableFooterView = UIView(frame: .zero)
    }
    private lazy var floatingButton = UIButton().then {
        $0.setImage(UIImage(symbol: SFSymbol.plus), for: .normal)
        $0.backgroundColor = UIColor(named: "Main")
        $0.tintColor = .white
        //        $0.addTarget(self, action: #selector(), for: .touchUpInside)
        $0.setShadow(opacity: 0.2,
                     offSet: CGSize(width: 0, height: 3),
                     radius: 2)
    }
    private let leftBarButton = UIButton().then {
        $0.setTitle("홍제동", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 17)
        $0.setTitleColor(.black, for: .normal)
        $0.setImage(UIImage(symbol: SFSymbol.chevronDown), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        $0.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        //        $0.addTarget(self, action: #selector(), for: .touchDragInside)
    }
    private let searchBarButton = UIBarButtonItem().then {
        $0.image = UIImage(symbol: SFSymbol.magnifyingglass)
    }
    private let categoryBarButton = UIBarButtonItem().then {
        $0.image = UIImage(symbol: SFSymbol.listDash)
    }
    private let noticeBarButton = UIBarButtonItem().then {
        $0.image = UIImage(symbol: SFSymbol.bell)
    }

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
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        floatingButton.layer.cornerRadius = floatingButton.frame.height / 2
    }

    // MARK: - Function
    private func setupUI() {
        self.view.addSubview(tableView)
        self.view.addSubview(floatingButton)

        setConstraint()
    }

    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        floatingButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.width.height.equalTo(60)
        }
    }

    private func setNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .black
        let stackView = UIStackView
            .appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        stackView.spacing = -10
        setBarButtonItem()
    }

    private func setBarButtonItem() {
        let leftBarButton = UIBarButtonItem(customView: leftBarButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItems = [noticeBarButton, categoryBarButton, searchBarButton]
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueCell(withType: HomeTableViewCell.self,
                             for: indexPath) as? HomeTableViewCell
        else {
            return .init()
        }

        cell.configure()
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
