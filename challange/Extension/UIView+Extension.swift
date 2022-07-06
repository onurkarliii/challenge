//
//  UIView+Extension.swift
//  challange
//
//  Created by Onur on 6.07.2022.
//

import UIKit

extension UIView {
    func addShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 8
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
    }
}
