#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

// Designated initializer
- (instancetype) initWithUsername:(NSString *)username
					  andPassword:(NSString *)password;
@end
