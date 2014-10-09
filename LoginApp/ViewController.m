//
//  ViewController.m
//  LoginApp
//
//  Created by Alessandro on 09/10/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "ViewController.h"
#import "Users.h"
#import "User.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISwitch *willRememberUserData;

@property (nonatomic, strong) Users *users;

@end

@implementation ViewController

- (IBAction)loginButtonPressed:(UIButton *)sender {
	BOOL remember = self.willRememberUserData.isOn;

	NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	NSString *username = [self.usernameTextField.text stringByTrimmingCharactersInSet:whiteSpace];
	NSString *password = [self.passwordTextField.text stringByTrimmingCharactersInSet:whiteSpace];
	User *user = [[User alloc] initWithUsername:username
	     							andPassword:password];
	
	if (username.length && password.length && [self.users isLegit:user]) {
		NSLog(@"User logged in");
		if (remember) {
			[self.users addUser:user];
			NSLog(@"Login details stored");
		}
	} else {
		NSLog(@"Not a valid username/password combination");
	}
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
	self.usernameTextField.text = @"";
	self.passwordTextField.text = @"";
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (Users *)users{
	if (!_users) {
		_users = [[Users alloc] init];
	}
	return _users;
}

@end
