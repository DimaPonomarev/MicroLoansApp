//
//  ThirdViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//
//
//  SecondViewController.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
           
    //  MARK: External dependencies

    var coordinator: LoadingOutput?
    
    //MARK: - UI properties
    
    private let logoImageView = UIImageView()
    private let cancelButton = CutomCancelButton()
    private let roundedImageView = UIImageView()
    private let nextPageButton = CutomCancelButton()

  
    //MARK: - View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        addViews()
        setupViews()
        makeConstraints()
        setupActions()
    }
}

//  MARK: - private methods

private extension ThirdViewController {
    
    //MARK: - addViews
    
    func addViews() {
        view.addSubview(logoImageView)
        view.addSubview(cancelButton)
        view.addSubview(roundedImageView)
        view.addSubview(nextPageButton)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
        }
        roundedImageView.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(80)
            make.bottom.equalTo(nextPageButton.snp.top).inset(-60)
        }
        nextPageButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(32)
        }
        
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = .logo
        roundedImageView.contentMode = .scaleAspectFit

        cancelButton.setupCancelButton()
        nextPageButton.setupNextButton()
        roundedImageView.image = .third
    }
    
    //MARK: - setupActions
    
    func setupActions() {
        nextPageButton.addTarget(self, action: #selector(showNextScreen), for: .touchDown)
        cancelButton.addTarget(self, action: #selector(showMainPage), for: .touchDown)
    }
    
    // MARK: - objc method
    
    @objc func showNextScreen() {
        coordinator?.showMainScreen()
    }
    
    @objc func showMainPage() {
        coordinator?.showMainScreen()
    }
}
