//
//  GithubSearchUITests.m
//  GithubSearchUITests
//
//  Created by Jian Zhang on 12/27/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GithubSearchUITests : XCTestCase

@end

@implementation GithubSearchUITests

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

- (void)testLoginSuccess {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElement *textField = app.textFields[@"用户名"];
  [textField tap];
  [textField typeText:@"tw@tw.com"];
  
  XCUIElement *secureTextField = app.secureTextFields[@"密码"];
  [secureTextField tap];
  [secureTextField typeText:@"password00"];
  [app.buttons[@"Login"] tap];
  
  XCUIElement *searchText = app.staticTexts[@"Search"];
  NSPredicate *exists = [NSPredicate predicateWithFormat:@"exists == 1"];
  [self expectationForPredicate:exists evaluatedWithObject:searchText handler:nil];
  [self waitForExpectationsWithTimeout:5 handler:nil];
  XCTAssertNotNil(searchText);
}

- (void)testLoginFail {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElement *textField = app.textFields[@"用户名"];
  [textField tap];
  [textField typeText:@"tw@163.com"];
  
  XCUIElement *secureTextField = app.secureTextFields[@"密码"];
  [secureTextField tap];
  [secureTextField typeText:@"password00"];
  [app.buttons[@"Login"] tap];
  
  XCUIElement *searchText = app.staticTexts[@"Search"];
  [self waitForElementToNotAppear:searchText withTimeout:5];
}

- (void)testSearch {
  
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElement *textField = app.textFields[@"用户名"];
  [textField tap];
  [textField typeText:@"tw@tw.com"];
  
  XCUIElement *secureTextField = app.secureTextFields[@"密码"];
  [secureTextField tap];
  [secureTextField tap];
  [secureTextField typeText:@"password00"];
  [app.buttons[@"Login"] tap];
  
  XCUIElement *textField2 = app.textFields[@"搜索关键字"];
  [textField2 tap];
  [textField2 typeText:@"tom"];
  [app.navigationBars[@"Search"].buttons[@"Search"] tap];
  XCUIElement *userNickNameLabel = app.collectionViews.staticTexts[@"Tom"];
  [self waitForElementToAppear:userNickNameLabel withTimeout:5];
}

- (void)waitForElementToAppear:(XCUIElement *)element withTimeout:(NSTimeInterval)timeout
{
  NSUInteger line = __LINE__;
  NSString *file = [NSString stringWithUTF8String:__FILE__];
  NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"exists == true"];
  
  [self expectationForPredicate:existsPredicate evaluatedWithObject:element handler:nil];
  
  [self waitForExpectationsWithTimeout:timeout handler:^(NSError * _Nullable error) {
    if (error != nil) {
      NSString *message = [NSString stringWithFormat:@"Failed to find %@ after %f seconds",element,timeout];
      [self recordFailureWithDescription:message inFile:file atLine:line expected:YES];
    }
  }];
}

- (void)waitForElementToNotAppear:(XCUIElement *)element withTimeout:(NSTimeInterval)timeout
{
  NSUInteger line = __LINE__;
  NSString *file = [NSString stringWithUTF8String:__FILE__];
  NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"exists == false"];
  
  [self expectationForPredicate:existsPredicate evaluatedWithObject:element handler:nil];
  
  [self waitForExpectationsWithTimeout:timeout handler:^(NSError * _Nullable error) {
    if (error != nil) {
      NSString *message = [NSString stringWithFormat:@"Failed to find %@ after %f seconds",element,timeout];
      [self recordFailureWithDescription:message inFile:file atLine:line expected:YES];
    }
  }];
}

@end
