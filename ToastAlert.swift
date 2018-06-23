/*
 The MIT License (MIT)

 Copyright (c) 2018 Daniel Illescas Romero <https://github.com/illescasDaniel>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

import UIKit

struct ToastAlert {
	
	struct Length {
		let timeInterval: DispatchTimeInterval
		static let short = Length(timeInterval: .milliseconds(250))
		static let long = Length(timeInterval: .milliseconds(500))
	}
	
	private let alertController: UIAlertController
	private let length: ToastAlert.Length
	
	@discardableResult
	static func present(message: String, withLength length: ToastAlert.Length, in viewController: UIViewController) -> Bool {
		return ToastAlert.makeWith(message: message, length: length).present(in: viewController)
	}
	
	static func makeWith(message: String, length: ToastAlert.Length) -> ToastAlert {
		return ToastAlert(alertController: UIAlertController(title: nil, message: message, preferredStyle: .alert),
					length: length)
	}
	
	@discardableResult
	func present(in viewController: UIViewController, onCompletion: @escaping () -> () = {}) -> Bool {
		
		guard viewController.presentedViewController == nil else  { return false }
		
		viewController.present(self.alertController, animated: true) {
			DispatchQueue.main.asyncAfter(deadline: .now() + self.length.timeInterval) {
				self.alertController.dismiss(animated: true, completion: onCompletion)
			}
		}
		return true
	}
}
