//
//  ViewController.swift
//  CompactControllerTask
//
//  Created by Andrii's Macbook  on 15.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var pesentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

private extension ViewController {
    @IBAction func presentAction(_ sender: UIButton) {
        showPopoverView(from: pesentButton)
    }
}

private extension ViewController {
    func showPopoverView(from sourceView: UIView) {
        let popoverVC = PopoverViewController()
        popoverVC.modalPresentationStyle = .popover
        if let popoverPresentationController = popoverVC.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = sourceView
            popoverPresentationController.sourceRect = sourceView.bounds
            popoverPresentationController.delegate = self
        }
        present(popoverVC, animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none 
    }
}






