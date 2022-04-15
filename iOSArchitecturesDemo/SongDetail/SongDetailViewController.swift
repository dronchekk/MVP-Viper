//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 11.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {

    public var song: ITunesSong

    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }

    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
    }

}
