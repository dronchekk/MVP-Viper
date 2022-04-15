//
//  Nib.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 14.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

extension UIView {
     class func loadFromNib<T: UIView>() -> T {
         return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)![0] as! T
     }
 }
