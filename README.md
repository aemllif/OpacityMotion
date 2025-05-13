
# 📦 OpacityMotion

`OpacityMotion` is a library for iOS that allows you to animate the **opacity** of elements on the screen based on the device's tilt. It works with **arrays of elements** (texts, images, and other structures) and allows you to customize the **minimum/maximum opacity**, **sensitivity**, and **layout configuration** of the elements.

---

## 🛠 Installation

### Using Swift Package Manager

1. Open your project in Xcode.
2. Go to **File > Swift Packages > Add Package Dependency**.
3. Enter the repository URL:

   ```
   https://github.com/aemllif/OpacityMotion.git
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
            items: symbols,
            columnsCount: 4,
            columnWidth: 50,
            columnSpacing: 12,
            rowSpacing: 16,
            minOpacity: 0.1,
            maxOpacity: 0.6,
            intensity: 1.0
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
    let images: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!
    ]

    var body: some View {
        OpacityMotionView(
            items: images,
            columnsCount: 3,
            columnWidth: 100,
            columnSpacing: 16,
            rowSpacing: 20,
            minOpacity: 0.1,
            maxOpacity: 0.6,
            intensity: 1.0
        ) { image in
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
        }
        .padding()
    }
}
```

---

## 📜 Description

`OpacityMotion` uses **CoreMotion** to track device tilt along the **X** and **Y** axes, and dynamically animates the opacity of individual elements based on that motion.

### Features:
- Works with arrays of any type of content: text, images, or custom views.
- Smooth, per-element opacity animation.
- Independent behavior for each item.
- Fully configurable layout (columns, spacing).
- Adjustable sensitivity and opacity bounds.

---

## 🔧 Settings and Parameters

- `items`: An array of your data (e.g. `[String]`, `[UIImage]`, or custom structs).
- `columnsCount`: Number of columns in the grid (default: `5`).
- `columnWidth`: Width of each column in points (default: `50`).
- `columnSpacing`: Horizontal spacing between columns (default: `10`).
- `rowSpacing`: Vertical spacing between rows (default: `12`).
- `minOpacity`: Minimum opacity value per item (default: `0.0`).
- `maxOpacity`: Maximum opacity value per item (default: `0.5`).
- `intensity`: Controls how strongly tilt affects opacity (default: `0.7`).

---

## 📝 License

`OpacityMotion` is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

## 📄 Changelog

### 🚀 Version 1.0.0
- Initial release.
- Per-item opacity animation based on device tilt.
- Layout customization (columns, spacing).
- Support for any kind of view content.

---

## 🛠 Feedback and Issues

For suggestions, improvements, or bug reports, please open an issue or submit a pull request on GitHub.
