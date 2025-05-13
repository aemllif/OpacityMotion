
# 📦 OpacityMotion

`OpacityMotion` is a library for iOS that allows you to animate the **opacity** of elements on the screen based on the device's tilt. It works with **arrays of elements** (texts, images, and other structures) and allows you to customize the **minimum/maximum opacity** and **sensitivity** to the device's tilt.

---

## 🛠 Installation

### Using Swift Package Manager

1. Open your project in Xcode.
2. Go to **File > Swift Packages > Add Package Dependency**.
3. Enter the repository URL:

   ```
   https://github.com/YourUsername/OpacityMotion.git
   ```

4. Choose the version or branch to connect.

---

## ⚙️ How to Use

### Example 1: With an Array of Symbols

```swift
import SwiftUI
import OpacityMotion

struct ContentView: View {
    let symbols = [
        "$", "¥", "€", "£", "₣",
        "₾", "₴", "₹", "₽", "₺",
        "₩", "₪", "€", "₳", "₴",
        "₴", "₵", "₲", "₱", "₹",
        "₺", "₽", "₴", "₣", "₱"
    ]

    var body: some View {
        OpacityMotionView(
            items: symbols,  // Array of symbols
            minOpacity: 0.1,  // Minimum opacity
            maxOpacity: 0.6,  // Maximum opacity
            intensity: 1.0    // Sensitivity to tilt
        ) { symbol in
            Text(symbol)
                .font(.title2)
                .frame(width: 40, height: 40)
        }
        .padding()
    }
}
```

### Example 2: With an Array of Images

```swift
import SwiftUI
import OpacityMotion

struct ContentView: View {
    // Array of images
    let images: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!
    ]

    var body: some View {
        OpacityMotionView(
            items: images,  // Array of images
            minOpacity: 0.1,  // Minimum opacity
            maxOpacity: 0.6,  // Maximum opacity
            intensity: 1.0    // Sensitivity to tilt
        ) { image in
            // Display images with opacity animation
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
        .padding()
    }
}
```

### Parameters:

- **items**: An array of elements (can be strings, images, or any other structure).
- **minOpacity**: The minimum opacity of the element (default `0.0`).
- **maxOpacity**: The maximum opacity of the element (default `0.5`).
- **intensity**: The sensitivity of the opacity change based on the device's tilt (default `0.7`).

---

## 📜 Description

`OpacityMotion` uses **CoreMotion** to get the device's tilt data and change the opacity of passed elements based on the device's tilt along the **X** and **Y** axes. 

### Features:
- Supports any data types (texts, images, and other structures).
- Smooth opacity animation.
- Configurable minimum and maximum opacity values.
- High sensitivity to the device's tilt.

---

## 🔧 Settings and Parameters

- **`minOpacity`**: Minimum opacity (default `0.0`).
- **`maxOpacity`**: Maximum opacity (default `0.5`).
- **`intensity`**: Sensitivity of opacity change (default `0.7`).

---

## 📝 License

`OpacityMotion` is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

## 📄 Changelog

### 🚀 Version 1.0.0
- Initial release of the library.
- Implemented opacity animation based on the device's tilt.
- Supports any type of elements for animation (texts, images, and other structures).

---

## 🛠 Feedback and Issues

For suggestions or bug reports, please create issues or pull requests in the repository on GitHub.
