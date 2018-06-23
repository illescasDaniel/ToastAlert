## ToastAlert

A basic toast-like alert, similar to what to find in Android.

This is made using an AlertController (without inheritance) without any buttons and after a few milliseconds dismissing the alert.

### Usage

```swift
ToastAlert.present(message: "Hello", withLength: .short, in: self)

// Powerful alternative        
ToastAlert
    .makeWith(message: "Look!", length: .init(timeInterval: .milliseconds(780)))
    .present(in: self, onCompletion: {
        print("presented")
    })
```

