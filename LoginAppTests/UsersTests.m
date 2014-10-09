#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"
#import "Users.h"

@interface UsersTests : XCTestCase

@end

@implementation UsersTests

- (void) testUserGetsAdded {
	Users *users = [[Users alloc] init];
	User *u = [[User alloc] initWithUsername:@"Ale" andPassword:@"123"];
	BOOL userGotAdded = [users addUser:u];
	
	XCTAssertEqual(YES, userGotAdded);
}

- (void) testUserDoesntGetAddedTwice {
	Users *users = [[Users alloc] init];
	User *u = [[User alloc] initWithUsername:@"Ale" andPassword:@"123"];
	User *v = [[User alloc] initWithUsername:@"Ale" andPassword:@"123"];
	BOOL userGotAdded = [users addUser:u];
	userGotAdded = [users addUser:v];
	
	XCTAssertEqual(NO, userGotAdded);
}


- (void) testUsersDatabaseGetsReturnedAndObjectsAreOfClassUser {
	Users *users = [[Users alloc] init];
	NSArray *uList = [users allUsers];
	[uList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		XCTAssertTrue([obj isKindOfClass:[User class]]);
	}];
	

}

- (void) testIfUserIsLegit {
	Users *users = [[Users alloc] init];
	User *u = [[User alloc] initWithUsername:@"keyditina" andPassword:@"iphone"];
	XCTAssert([users isLegit:u]);
}


@end
