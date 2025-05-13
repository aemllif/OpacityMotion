//
//  File.swift
//  OpacityMotion
//
//  Created by Artem S on 13.05.2025.
//

#if os(iOS)
import CoreMotion
import Combine

final class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var roll: Double = 0.0
    @Published var pitch: Double = 0.0

    init() {
        startTrackingMotion()
    }

    private func startTrackingMotion() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.05
            motionManager.startDeviceMotionUpdates(to: .main) { data, _ in
                guard let attitude = data?.attitude else { return }
                self.roll = attitude.roll
                self.pitch = attitude.pitch
            }
        }
    }
}
#endif
