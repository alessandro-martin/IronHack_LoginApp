#import <Foundation/Foundation.h>
@class User;

@interface Users : NSObject

- (BOOL) addUser:(User *)user; // user MUST have a non nil username && password
- (NSArray *) allUsers;
- (BOOL) isLegit:(User *)user;

@end
