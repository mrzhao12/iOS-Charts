/**
 *使用CocosPod集成Charts
 *ttchartspod
 *赵彤彤 mrzhao12  ttdiOS
 *1107214478@qq.com
 *http://www.jianshu.com/p/cc3b600dded3
 *本程序是使用CocosPod集成Charts,避免了拖拽Charts工程到自己的工程里照成内存太大
 */

//  ttchartspodUITests.m
//  ttchartspodUITests
//
//  Created by sjhz on 2017/8/29.
//  Copyright © 2017年 sjhz. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ttchartspodUITests : XCTestCase

@end

@implementation ttchartspodUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
