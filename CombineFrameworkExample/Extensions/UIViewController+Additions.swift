//
//  UIViewController+Additions.swift
//  CombineFrameworkExample
//
//  Created by Ali Zaib on 16/11/2022.
//

import UIKit

extension UIViewController {
    static func loadFromStoryboard(inBundle bundle: Bundle = .main, storyboard: String) -> Self {
        func helper<T>() -> T {
            let sb = UIStoryboard(name: storyboard, bundle: bundle)
            return sb.instantiateViewController(withIdentifier: String(describing: self)) as! T
        }
        return helper()
    }
    
    @objc func navigated() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}
