//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 11.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import AVFoundation
import UIKit

class SongDetailViewController: UIViewController {

    @IBOutlet weak var trackImage: UIImageView!

    var player: AVAudioPlayer?
         var viewModel: PlaybackViewModel?

         init(selectIndex: Int, songs: [ITunesSong]) {

             print(songs[selectIndex].bigArtwork)

             viewModel = PlaybackViewModel(selectIndex: selectIndex, songs: songs)


             super.init(nibName: "SongDetailViewController", bundle: nil)
         }

    override func viewDidLoad() {
             super.viewDidLoad()

             self.navigationController?.navigationBar.tintColor = UIColor.white;
             self.navigationItem.largeTitleDisplayMode = .never

             viewModel?.playPause()
    }
        override func viewWillDisappear(_ animated: Bool) {
                 super.viewWillDisappear(animated)

                 viewModel.stop()
             }

    override func viewDidDisappear(_ animated: Bool) {
             super.viewDidDisappear(animated)

         }

    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}
