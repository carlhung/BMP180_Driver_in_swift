import XCTest

import BMP180Tests

var tests = [XCTestCaseEntry]()
tests += BMP180Tests.allTests()
XCTMain(tests)
