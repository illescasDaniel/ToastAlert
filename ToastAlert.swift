import UIKit

class ToastAlert {
	
	struct Length {
		let timeInterval: DispatchTimeInterval
		static let short = Length(timeInterval: .milliseconds(250))
		static let long = Length(timeInterval: .milliseconds(500))
	}
	
	static func present(message: String, withLength length: ToastAlert.Length = .short, in viewController: UIViewController) {
		ToastAlert().makeWith(message: message, length: length).present(in: viewController)
	}
	
	//
	
	class PresentableToast {
		
		private let internalAlertController: UIAlertController
		private let length: ToastAlert.Length
		
		init(alertController: UIAlertController, length: ToastAlert.Length) {
			self.internalAlertController = alertController
			self.length = length
		}
		
		func present(in viewController: UIViewController) {
			PresentableToast.present(alertController: internalAlertController, withLenght: length, in: viewController)
		}
		
		// MARK: - Convenience
		
		/// Returns false if could not present the alert
		@discardableResult
		static func present(alertController: UIAlertController, withLenght length: ToastAlert.Length, in viewController: UIViewController) -> Bool {
			
			guard viewController.presentedViewController == nil else  { return false }
			
			viewController.present(alertController, animated: true) {
				DispatchQueue.main.asyncAfter(deadline: .now() + length.timeInterval) {
					alertController.dismiss(animated: true)
				}
			}
			return true
		}
	}
	
	func makeWith(message: String, length: ToastAlert.Length = .short) -> PresentableToast {
		return PresentableToast(alertController: UIAlertController(title: nil, message: message, preferredStyle: .alert),
						length: length)
	}
}
