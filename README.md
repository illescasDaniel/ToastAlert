## ToastAlert

A basic toast-like alert, similar to what to find in Android.

This is made using an AlertController (without inheritance) without any buttons and after a few milliseconds dismissing the alert.

### Usage

```swift
ToastAlert.present(message: "Hello", withLength: .short, in: self)

// Alternative        
ToastAlert
    .makeWith(message: "Look!", length: .init(timeInterval: .milliseconds(780)))
    .present(in: self, onCompletion: {
        print("presented")
    })

// Asynchronous way
ToastAlert.present(onSuccess: "Saved", onError: "Error while saving", withLength: .short, 
                    playHapticFeedback: true, in: self, operation: {
    // do something that takes time to complete, return if the operation succeeded
    return SetOfTopics.shared.save(topic: TopicEntry(name: quiz.options?.name ?? "", content: quiz))
}, onCompletion: {
    print("completed")
})
```

