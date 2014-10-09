#import "User.h"

@implementation User

- (instancetype)init {
	return nil;
}

- (instancetype)initWithUsername:(NSString *)username
					 andPassword:(NSString *)password {

	if ((self = [super init])  && username && password) {
		_username = username;
		_password = password;
	} else {
		self = nil;
	}
	return self;
}

@end
