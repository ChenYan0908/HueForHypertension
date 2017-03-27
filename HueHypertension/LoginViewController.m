//
//  LoginViewController.m
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/7.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//


#import "LoginViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "NSObject+Tips.h"
#import "UserManager.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *switchButton;

@end

@implementation LoginViewController

//- (instancetype) init {
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginButton.layer setCornerRadius:10.0f];
    [self.loginButton.layer setBorderWidth:1.0f];
    [self.loginButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.registButton.layer setCornerRadius:10.0f];
    [self.registButton.layer setBorderWidth:1.0f];
    [self.registButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"rememberPassword"]) {
        self.switchButton.selected = YES;
        self.usernameTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        self.passwordTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)touchLoginButton:(UIButton *)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    if (username && password) {
        // LeanCloud - 登录
        // https://leancloud.cn/docs/leanstorage_guide-objc.html#登录
        [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
            if (error) {
                NSLog(@"登录失败 %@", error);
                [self showFailureTips:@"用户名密码错误"];
            } else {
                User *currentUser = [[User alloc] initWithId:user.objectId];
                [UserManager manager].user = currentUser;
                [[UserManager manager] saveAuthorizeData];
                [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
                [self.delegate loginDidSuccess];
            }
        }];
    } else {
        [self showFailureTips:@"用户名密码错误"];
    }
}
- (IBAction)touchRegistButton:(UIButton *)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    if (username && password) {
        AVUser *user = [AVUser user];
        user.username = username;
        user.password = password;
//        user.email = email;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"注册成功");
            } else {
                NSLog(@"注册失败 %@", error);
            }
        }];
    }
}

- (IBAction)touchSwitchButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    [[NSUserDefaults standardUserDefaults] setBool:sender.selected forKey:@"rememberPassword"];
}

@end
