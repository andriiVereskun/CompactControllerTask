//
//  PopoverViewController.swift
//  CompactControllerTask
//
//  Created by Andrii's Macbook  on 15.09.2023.
//

import UIKit

final class PopoverViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 300, height: 280)
        view.backgroundColor = .systemGray6
        setSegmentedControl()
        setupButton()
    }
    
    func setSegmentedControl() {
        let items = ["280pt", "150pt"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: (300 - 150) / 2, y: 16, width: 150, height: 32)
        segmentedControl.selectedSegmentIndex = .zero
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case .zero:
            UIView.animate(withDuration: 0.3, animations: {
                self.preferredContentSize =  CGSize(width: 300, height: 280)
                self.view.layoutIfNeeded()
            })
        case 1:
            UIView.animate(withDuration: 0.3, animations: {
                self.preferredContentSize = CGSize(width: 300, height: 150)
                self.view.layoutIfNeeded()
            })
        default:
            return
        }
    }
    
    func setupButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 300 - 32, y: 16, width: 32, height: 32)
        let buttonImage = UIImage(systemName: "xmark.circle.fill")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .systemGray2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        self.dismiss(animated: true)
    }
}
