//
//  DetailKnowledgeViewController.m
//  hypertension
//
//  Created by Yiyuan Liu on 16/9/19.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "DetailKnowledgeViewController.h"
#import "UIImage+MultiFormat.h"
#import "NSObject+Null.h"
#import "NSObject+Tips.h"
#import <AVOSCloud/AVOSCloud.h>

@interface DetailKnowledgeViewController () <UIWebViewDelegate>

@property (copy, nonatomic) NSString *urlStr;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;

@end

@implementation DetailKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    NSString *urlString = [NSString stringWithFormat:@"http://www.zjubiomedit.com:8080/health-knowledge/kno-contentbyID.jsp?kno_id=%ld",(long)self.model.knowledgeId];
    
    self.urlStr = urlString;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidAppear:animated];
}

#pragma mark - WebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self.indicator stopAnimating];
    [self.indicator removeFromSuperview];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.indicator setCenter:self.view.center];
    [self.view addSubview:self.indicator];
    [self.indicator startAnimating];

}


@end
