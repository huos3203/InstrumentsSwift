//
//  InstrumentsTutorialTests.swift
//  InstrumentsTutorialTests
//
//  Created by James Frost on 26/02/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit
import XCTest
@testable import InstrumentsTutorial
@testable import Alamofire
//@testable import OHHTTPStubs

class InstrumentsTutorialTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //激活虚拟网络
        InstallHTTPStubs.activateHttpStub()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    ///访问json数据
    func testExample() {
        // This is an example of a functional test case.
        InstallHTTPStubs().installImageStub(2, 3)
        Alamofire.request("https://www.baidu.com").response { (defaultRessponse) in
            //
            let str = defaultRessponse.response?.url?.absoluteString
            print(str)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //返回字典
    func testJSONData()
    {
        let jsonData = InstallHTTPStubs().fileToJSON(plist: "0.plist")
        let jsonStr = String.init(data: jsonData, encoding: .utf8)
        
    }
    
    
    //
    
}
