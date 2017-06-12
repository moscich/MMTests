import Foundation
import MMTests

public class Helper {
  public static func testSummary(_ results:[MMTestResult]) -> (passed:Int,failed:Int) {
  
  let passed = results.reduce(0) {
    let passed = $1.passed ? 1 : 0
    return $0 + passed
  }
  
  let failed = results.reduce(0) {
    let failed = $1.passed ? 0 : 1
    return $0 + failed
  }
  return (passed,failed)
}
}
