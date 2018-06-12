## ToastAlert

A basic toast-like alert, similar to what to find in Android.

This is made using an AlertController (without inheritance) without any buttons and after a few milliseconds dismissing the alert.

### Usage

```swift
ToastAlert.present(message: "Message sent", withLength: .short, in: self)
// Alternative
ToastAlert().makeWith(message: "An error ocurred", length: .long).present(in: self)
```

