import XCTest
import SwiftyGPIO
#if os(Linux) && canImport(Glibc)
import Glibc
#endif

@testable import BMP180

final class BMP180Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(BMP180().text, "Hello, World!")
        guard let bmp = BMP180(board: SupportedBoard.RaspberryPiPlusZero, bus: 1, address: 0x77) else { print("failed to init"); return }
        guard let _ = try? bmp.calibrate() else { print("can't calibrate"); return }
        
        while true {
            
            usleep(100 * 1000)
            
            guard let result = try? bmp.mesure(oversampling: .oss3) else {  print("failed to get the result"); return }
//            print(result)
            print("temp: \(result.celsius), pressure: \(result.hPa)")
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
