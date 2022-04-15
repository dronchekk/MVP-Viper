//
//  AppDetailInfoViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 11.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailInfoViewController: UIViewController {

    private let app: ITunesApp

    private var appDetailInfoView: AppDetailInfoView {
        return self.view as! AppDetailInfoView
    }

    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = AppDetailInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }

    private func fillData() {
        appDetailInfoView.ratingStarView.value = CGFloat(app.averageRating ?? 0)
        appDetailInfoView.ratingInfoLabel.text = String(format: "%.1f", app.averageRating ?? 0)

        if let byte = app.size {
            let sizeMB = byte / 1000000
            appDetailInfoView.sizeLabel.text = "\(sizeMB)"
        }

        appDetailInfoView.ageRestrictionsLabel.text = app.ageRestrictions
    }

}
