//
//  File.swift
//  OpacityMotion
//
//  Created by Артём Сидоров on 13.05.2025.
//

#if os(iOS)
import SwiftUI

public struct OpacityMotionView<T, Content: View>: View {
    private let items: [T]
    private let content: (T) -> Content

    private let minOpacity: Double
    private let maxOpacity: Double
    private let intensity: Double

    @ObservedObject private var motionManager = MotionManager()

    private let columns: [GridItem]
    private let symbolSettings: [SymbolSettings]

    private let pitchWeight = 1.0
    private let rollWeight = 2.0

    public init(
        items: [T],
        columns: [GridItem] = Array(repeating: GridItem(.fixed(50), spacing: 10), count: 5),
        minOpacity: Double = 0.0,
        maxOpacity: Double = 0.5,
        intensity: Double = 0.7,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.items = items
        self.columns = columns
        self.content = content
        self.minOpacity = minOpacity
        self.maxOpacity = maxOpacity
        self.intensity = intensity
        self.symbolSettings = items.map { _ in
            SymbolSettings(
                initialOpacity: Double.random(in: minOpacity...maxOpacity),
                increaseOnPitch: Bool.random(),
                decreaseOnRoll: Bool.random(),
                reverseEffect: Bool.random()
            )
        }
    }

    public var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                let settings = symbolSettings[index]
                let opacity = calculateOpacity(for: settings)

                content(item)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 0.15), value: opacity)
            }
        }
    }

    private func calculateOpacity(for settings: SymbolSettings) -> Double {
        let pitch = tanh(motionManager.pitch * 10.0)
        let roll = tanh(motionManager.roll * 10.0)

        let pitchComponent = pitch * (settings.increaseOnPitch ? 1 : -1) * pitchWeight
        let rollComponent = roll * (settings.decreaseOnRoll ? -1 : 1) * rollWeight

        var change = (pitchComponent + rollComponent) * intensity

        if settings.reverseEffect {
            change *= -1
        }

        let newOpacity = settings.initialOpacity + change
        return min(max(newOpacity, minOpacity), maxOpacity)
    }
}

public struct SymbolSettings {
    public let initialOpacity: Double
    public let increaseOnPitch: Bool
    public let decreaseOnRoll: Bool
    public let reverseEffect: Bool
}
#endif
