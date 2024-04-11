//
//  HowItWorksViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 26.01.2024.
//

import UIKit

final class HowItWorksViewController: UIViewController {

    //  MARK: - UI properties
    
    private let logoImageView = UIImageView()
    private let tableView = UITableView()
    private var model = ConstantsForModelForCell.model
    
    //  MARK: - life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//  MARK: - private methods

private extension HowItWorksViewController {
    
    //  MARK: - setup UI
    
    func setup() {
        addViews()
        setupViews()
        setupConstraints()
    }
        
    func addViews() {
        view.addSubview(logoImageView)
        view.addSubview(tableView)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = .logo
        tableView.register(HowItWorksTableViewCell.self, forCellReuseIdentifier: HowItWorksTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
        
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30).priority(.low)
            make.top.equalTo(view.layoutMarginsGuide).priority(.high)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)

        }
    }
}

extension HowItWorksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HowItWorksTableViewCell.identifier, for: indexPath) as? HowItWorksTableViewCell else { return UITableViewCell()}
        let cellModel = model[indexPath.row]
        cell.configureView(cellModel)
        
        return cell
    }
}

extension HowItWorksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model[indexPath.row].isTapped.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}








