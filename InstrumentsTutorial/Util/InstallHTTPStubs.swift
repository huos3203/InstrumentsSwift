//
//  InstallHTTPStubs.swift
//  InstrumentsTutorial
//
//  Created by pengyucheng on 13/04/2017.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//
/**
 OHHTTPStubsProtocol 拦截 HTTP 请求
 OHHTTPStubs 单例管理 OHHTTPStubsDescriptor 实例
 OHHTTPStubsResponse 伪造 HTTP 响应
 一些辅助功能
 OHHTTPStubs 不支持 后台sessions(sessions created using [NSURLSessionConfiguration backgroundSessionConfiguration]) because background sessions don't allow the use of custom NSURLProtocols and are handled by the iOS Operating System itself.
 [Demo](https://github.com/AliSoftware/OHHTTPStubs/blob/master/Examples/Swift/MainViewController.swift)
 **/

import UIKit
import OHHTTPStubs

class InstallHTTPStubs: NSObject
{
    var installStubs:OHHTTPStubsDescriptor?
    
    // 激活模拟器
    func activateHttpStub()
    {
        //
        OHHTTPStubs.onStubActivation { (request, stubDesc, response) in
            //
            print("[OHHTTPStubs] Request to \(request.url) has been stubbed with \(stubDesc.name)")
        }
        OHHTTPStubs.setEnabled(true)
    }
    
    
    //模拟图片
    func installImageStub(_ requestDelay:TimeInterval, _ responseDelay:TimeInterval)
    {
        //
        installStubs = stub(condition:(isExtension("png")||isExtension("jpg"))){ _ in
            //
            let imagePath = OHPathForFile("stub.jpg", type(of:self))
            let header = ["Content-Type":"image/jpeg"]
            let responseStub = fixture(filePath: imagePath!, headers: header)
            return responseStub
        }
        
        installStubs?.name = "图片路径"
    }
    
    
    //模拟文本
    
    
    
    //模拟data

}
