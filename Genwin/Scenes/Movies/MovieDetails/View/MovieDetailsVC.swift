//
//  MovieDetailsVC.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import UIKit

class MovieDetailsVC: BaseVC {
    
    //MARK: - Properties
    var viewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupStatusBar()
        setupNavBar()
    }
    
    private func setupInitialDesign(){
        view.backgroundColor = AppColors.shared.blackBackgroundColor
    }
    
    
    private func setupNavBar(){
        navigationController?.navigationBar.backgroundColor = AppColors.shared.orangeNavigationColor
    }
    
    private func setupStatusBar(){
        setupStatusBar(color: AppColors.shared.orangeStatusBarColor)
    }
    


}
