//
//  Extension+ImageView.swift
//  Movies
//
//  Created by Felipe Assis on 17/12/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImageFromURL(urlImage: String) -> Void {
        let url = URL(string: urlImage)
        self.kf.setImage(with: url)
    }
}
