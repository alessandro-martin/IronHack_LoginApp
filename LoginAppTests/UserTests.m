#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"

@interface UserTests : XCTestCase

@end

@implementation UserTests
- (void) testUserCreation{
	NSString *uName = @";";
	NSString *uPass = @"pieceofmind";
	
	User *u = [[User alloc] initWithUsername:uName
								 andPassword:uPass];
	
	XCTAssertEqualObjects(u.username, uName);
	XCTAssertEqualObjects(u.password, uPass);
}

- (void) testUserInitReturnsNil {
	User *u = [[User alloc] init];
	
	XCTAssertEqualObjects(u, nil);
}

- (void) testUserInitWithNilUsernameReturnsNil {
	User *u = [[User alloc] initWithUsername:nil andPassword:@"123"];
	
	XCTAssertEqualObjects(u, nil);
}

- (void) testUserInitWithNilPasswordReturnsNil {
	User *u = [[User alloc] initWithUsername:@"Ale" andPassword:nil];
	
	XCTAssertEqualObjects(u, nil);
}

- (void) testUserInitWithNilUsernameAndNilPasswordReturnsNil {
	User *u = [[User alloc] initWithUsername:nil andPassword:nil];
	
	XCTAssertEqualObjects(u, nil);
}


@end
