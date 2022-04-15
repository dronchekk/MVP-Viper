//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 11.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SongDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    private func configureUI() {
        backgroundColor = .white
    }
}
