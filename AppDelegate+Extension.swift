////
////  AppDelegate+Extension.swift
////  JailBreakObjectiveC
////
////  Created by Vishal Dhamecha on 09/01/23.
////
//
//import Foundation
//import UIKit
//extension AppDelegate {
//
//  @objc public func checkJailBreak() -> Bool {
//         let isJailBreak = UIDevice().isJailBroken
//         print("Is jail Broken \(isJailBreak)")
//         return isJailBreak
//     }
//
//}


//
//  AppDelegate+Extension.swift
//  JailBreakObjectiveC
//
//  Created by Vishal Dhamecha on 09/01/23.
//

import Foundation
import UIKit

class RuntimeClass {
   @objc dynamic func runtimeModifiedFunction()-> Int {
       exit(0)
   }
}

extension AppDelegate{
    
  @objc public func checkJailBreak() -> Bool {
          let isDeviceJailbroken: Bool = IOSSecuritySuite.amIJailbroken()
          return isDeviceJailbroken
      }
  
  @objc public func checkIfRunEmulator() -> Bool {
      let isEmulator: Bool = EmulatorChecker.amIRunInEmulator()
            return isEmulator
        }
    
    @objc public func checkIfDebuggerOn() -> Bool {
      DebuggerChecker.denyDebugger()
      let isDebugOn: Bool = DebuggerChecker.amIDebugged()
            return isDebugOn
        }
    
    @objc public func checkRunTimeHook(){
        
        let dylds = ["UIKit"]
        let amIRuntimeHooked = IOSSecuritySuite.amIRuntimeHooked(dyldWhiteList: dylds, detectionClass: RuntimeClass.self, selector: #selector(RuntimeClass.runtimeModifiedFunction), isClassMethod: false)
        
    }
    
}

