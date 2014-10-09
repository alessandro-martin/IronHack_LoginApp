#import "Users.h"
#import "User.h"

@interface Users ()

@property (nonatomic, strong) NSMutableArray *usersDatabase;

@end

@implementation Users

- (instancetype)init
{
	if (self = [super init]) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"plist"];
		NSArray *tempArray = [NSArray arrayWithContentsOfFile:path]; // Array of dictionaries each of which is a user
		[tempArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			NSDictionary *d = (NSDictionary *) obj;
			User *u = [[User alloc] initWithUsername:d[@"username"]
										 andPassword:d[@"password"]];
			[self addUser:u];
		}];
	}
	return self;
}

- (BOOL) addUser:(User *)user {
	if (![self userAlreadyExists:user] && user.username && user.password) {
		[self.usersDatabase addObject:user];
		return YES;
	}
	return NO;
}

- (BOOL) userAlreadyExists:(User *) user{
	for (User *u in self.usersDatabase) {
		if ([u.username isEqualToString:user.username]) {
			return YES;
		}
	}
	return NO;
}

- (BOOL) isLegit:(User *)user {
	if ([self userAlreadyExists:user]) {
		return [user.password isEqualToString:[self getPasswordForUsername:user.username]];
	}
	return NO;
}
				
- (NSString *) getPasswordForUsername:(NSString *)username{
	for (User *u in self.usersDatabase) {
		if ([u.username isEqualToString:username]) {
			return u.password;
		}
	}
	return @"";
}

- (NSMutableArray *)usersDatabase {
	if (!_usersDatabase) {
		_usersDatabase = [[NSMutableArray alloc] init];
	}
	
	return _usersDatabase;
}

- (NSArray *) allUsers {
	return (NSArray *) self.usersDatabase;
}


@end
