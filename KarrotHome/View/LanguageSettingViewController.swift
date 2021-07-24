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
    /// 언어 설정 변경 처리
    func changedLanguageSetting()
}

final class LanguageSettingViewController: UIViewController {

    // MARK: - UIComponent
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 100
        $0.separatorStyle = .none
        $0.registerCell(withType: UITableViewCell.self)
        $0.tableFooterView = UIView(frame: .zero)
    }

    // MARK: - Property
    weak var delegate: LanguageSettingVCDelegate?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setNavigation()
    }

    // MARK: - Function
    private func setupUI() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        setConstraint()
    }

    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setNavigation() {
        self.title = "Language settings".localized
        self.navigationController?.navigationBar.topItem?.title = ""
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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "LanguageCell")

        cell.textLabel?.text = Language.allCases[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension LanguageSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        UserManager.languageKey = Language.allCases[indexPath.row].code
        delegate?.changedLanguageSetting()
        self.navigationController?.popViewController(animated: true)
    }
}
