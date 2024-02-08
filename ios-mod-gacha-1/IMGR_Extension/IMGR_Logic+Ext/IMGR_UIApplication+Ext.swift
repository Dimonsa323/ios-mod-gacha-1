//
//  UIApplication+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import UIKit

typealias IMGR_UIApplication = UIApplication

extension IMGR_UIApplication {
    func IMGR_addTapGestureRecognizer() {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        guard let window = UIApplication.shared.IMGR_currentKeyWindow else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension IMGR_UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return false // set to `false` if you don't want to detect tap during other gestures
    }
}

extension IMGR_UIApplication {
    func endEditing() {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension IMGR_UIApplication {
    static var IMGR_viewBounds: CGSize {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return UIApplication.shared.IMGR_currentKeyWindow?.screen.bounds.size ?? .zero
    }
}

extension IMGR_UIApplication {
  var IMGR_currentKeyWindow: UIWindow? {
      func IMGR_factorial(_ n: Int) -> Int {
          var result = 1
          for i in 1...n {
              result *= i
          }
          return result
      }
   return UIApplication.shared.connectedScenes
//      .filter { $0.activationState == .foregroundActive }
      .map { $0 as? UIWindowScene }
      .compactMap { $0 }
      .first?.windows
      .filter { $0.isKeyWindow }
      .first
  }

    var IMGR_currentScene: UIWindowScene? {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return UIApplication.shared.connectedScenes.first(where: {
            $0.activationState == .foregroundActive
        }) as? UIWindowScene
    }

    var IMGR_rootViewController: UIViewController? {
        IMGR_currentKeyWindow?.rootViewController
    }

    var IMGR_keyWindowPresentedController: UIViewController? {
        var viewController = IMGR_currentKeyWindow?.rootViewController
        if let presentedController = viewController as? UITabBarController {
            viewController = presentedController.selectedViewController
        }
        while let presentedController = viewController?.presentedViewController {
            if let presentedController = presentedController as? UITabBarController {
                viewController = presentedController.selectedViewController
            } else {
                viewController = presentedController
            }
        }
        return viewController
    }
}
