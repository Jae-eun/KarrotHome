//
//  LanguageSettingViewController.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/21.
//

import Foundation
import UIKit
import Then

protocol LanguageSettingVCDelegate: AnyObject {
    func changeLanguageSetting()
}

final class LanguageSettingViewController: UIViewController {

    // MARK: - UIComponents
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 100
        $0.separatorStyle = .none
        $0.registerCell(withType: UITableViewCell.self)
        $0.tableFooterView = UIView(frame: .zero)
    }
    private lazy var resetButton = UIBarButtonItem(title: "Reset".localized,
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(push))

    @objc func push() {
        print("PUsh")
    }

    // MARK: - Property
    weak var delegate: LanguageSettingVCDelegate?

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

    // MARK: - Function
    private func setupUI() {
        self.view.addSubview(tableView)

        setConstraint()
    }

    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setNavigation() {
        self.title = "Language settings".localized
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        setBarButtonItem()
    }

    private func setBarButtonItem() {
        self.navigationItem.rightBarButtonItem = resetButton
    }
}

// MARK: - UITableViewDataSource

extension LanguageSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return Language.allCases.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")

        cell.textLabel?.text = Language.allCases[indexPath.row].name.localized
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension LanguageSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        UserManager.languageKey = Language.allCases[indexPath.row].code
        delegate?.changeLanguageSetting()
        self.navigationController?.popViewController(animated: true)
    }
}
