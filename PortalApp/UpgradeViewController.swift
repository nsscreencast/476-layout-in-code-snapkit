//
//  UpgradeViewController.swift
//  PortalApp
//
//  Created by Ben Scheirman on 1/19/21.
//

import UIKit
import SnapKit

class UpgradeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        view.backgroundColor = .white
        
        let background = BackgroundView()
        view.addSubview(background)
       
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

class BackgroundView: CustomView {
    override func setupView() {
        let imageView = UIImageView(image: UIImage(named: "night-scene"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        let fadeToBlack = GradientView()
        fadeToBlack.isOpaque = false
        fadeToBlack.startColor = .clear
        fadeToBlack.endColor = .black
        fadeToBlack.locations = [0.25, 0.58]
        addSubview(fadeToBlack)
        
        fadeToBlack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let box = UIView()
        box.backgroundColor = .systemGreen
        addSubview(box)
        
        box.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
                .priority(.low)
        }
        
        box.snp.updateConstraints { update in
            update.width.equalTo(300).priority(.low)
        }
    }
}

#if DEBUG
import SwiftUI

struct UpgradeViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview<UpgradeViewController>()
    }
}
#endif
