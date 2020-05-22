//
//  InstallHTTPStubs.swift
//  InstrumentsTutorial
//
//  Created by pengyucheng on 13/04/2017.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import UIKit
import OHHTTPStubs
import HandyJSON
/**
 得到的
 
- OHHTTPStubsProtocol 拦截 HTTP 请求
- OHHTTPStubs 单例管理 HTTPStubsDescriptor 实例
- OHHTTPStubsResponse 伪造 HTTP 响应
- 一些辅助功能
 
 注意：OHHTTPStubs 不支持 后台sessions(sessions created using [NSURLSessionConfiguration backgroundSessionConfiguration]) because background sessions don't allow the use of custom NSURLProtocols and are handled by the iOS Operating System itself.
 
 [Demo](https://github.com/AliSoftware/OHHTTPStubs/blob/master/Examples/Swift/MainViewController.swift)
 
 [官方文档](https://github.com/AliSoftware/OHHTTPStubs/wiki/Usage-Examples)
 */
public class InstallHTTPStubs: NSObject
{
    var installStubs:HTTPStubsDescriptor?
    
    // 激活模拟器
    public class func activateHttpStub()
    {
        //
         HTTPStubs.onStubActivation { (request: URLRequest, stub: HTTPStubsDescriptor, response: HTTPStubsResponse) in
            //
            print("[OHHTTPStubs] Request to \(request.url!) has been stubbed with \(stub.name)")
        }
        HTTPStubs.setEnabled(true)
    }
    
    
    //模拟图片
    func installImageStub(_ requestDelay:TimeInterval, _ responseDelay:TimeInterval)
    {
        //
        installStubs = stub(condition:(isExtension("png")||isExtension("jpg"))){ _ in
            //
            let imagePath = OHPathForFile("stub.jpg", type(of:self))
            let header = ["Content-Type":"image/jpeg"]
            let responseStub = fixture(filePath: imagePath!, headers: header as [NSObject : AnyObject])
            return responseStub
        }
        installStubs?.name = "图片路径"
    }
    
    
    //模拟文本
    
    
    
    //模拟data
    public func installJSONDataStub(plist:String)
    {
        //plist转为JSON数据
        let imagePath = OHPathForFile("0.plist", type(of:self))
        let jsonData = fileToJSON(plist: imagePath!)
        
        //封装响应包
        installStubs = HTTPStubs.stubRequests(passingTest: { (request:URLRequest) -> Bool in
            //
            return request.url?.host == ""
        }, withStubResponse: { (request:URLRequest) -> HTTPStubsResponse in
            //
            let response = HTTPStubsResponse.init(jsonObject: jsonData, statusCode: 200, headers: ["Content-Type":"application/json"])
            return response
        })
        
    }
    
    
    public func fileToJSON(plist:String)->Data
    {
        //
        let filePath = plist//OHPathForFile(plist, type(of:self))
        let array = NSArray.init(contentsOfFile: filePath)
         _ = [:]
        array?.enumerateObjects({ (obj, index, bool) in
            //
            
            
        })
        let dic = array?[0]//NSDictionary(contentsOfFile: filePath) as! Dictionary<NSObject,Any>
        var jsonData = Data()
        if JSONSerialization.isValidJSONObject(dic)
        {
            do {
                jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            } catch {
                //如果catch分句中没有任何匹配模式，那么这个分局将会匹配到所有的错误，并把这些错误信息赋值给系统常量error
                print(error)
            }
        }
        return jsonData
    }

}
