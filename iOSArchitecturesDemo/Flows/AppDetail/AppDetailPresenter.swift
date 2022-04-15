//
//  AppDetailPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 10.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol AppDetailViewInput: AnyObject {
    var app: ITunesApp { get set }
}

protocol AppDetailViewOutput: AnyObject {
    func getSizeText(text: String) -> CGSize
}

class AppDetailPresenter {

    private func getLabelSize(text: String, font: UIFont) -> CGSize {

        let maxWidth =  UIScreen.main.bounds.width - 16 * 2
        let textBlock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        let rect = text.boundingRect(with: textBlock, options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font: font], context: nil)
        let width = Double(rect.size.width)
        let height = Double(rect.size.height)
        let size = CGSize(width: ceil(width), height: ceil(height))
        return size
    }

}

extension AppDetailPresenter: AppDetailViewOutput {
    func getSizeText(text: String) -> CGSize {
        return getLabelSize(text: text, font: UIFont.systemFont(ofSize: 15))
    }
}

