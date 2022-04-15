//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Rubtsov on 28.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailHeaderViewController: UIViewController {
    
    // MARK: - Properties

    private let presenter: AppDetailViewOutput
    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()
    
    private var appDetailHeaderView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    // MARK: - Construction
    
    init(app: ITunesApp, presenter: AppDetailViewOutput) {
        self.app = app
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    // MARK: - Private Functions
    
    private func fillData() {
        downloadImage()
        
        appDetailHeaderView.titleLabel.text = app.appName
        appDetailHeaderView.subtitleLabel.text = app.company
        appDetailHeaderView.openButton.addTarget(self, action: #selector(didTapOpenApp), for: .touchUpInside)
    }

    @objc private func didTapOpenApp() {
             presenter.openAppInITunes(app: app)
    }
    
    private func downloadImage() {
        guard let url = app.iconUrl else { return }

        imageDownloader.getImage(fromUrl: url) { [weak self] (image, error) in
            guard let self = self else { return }

            if let error = error {
                print(error.localizedDescription)
                return
            }

            DispatchQueue.main.async {
                self.appDetailHeaderView.imageView.image = image
            }
        }
    }
}
