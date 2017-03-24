//
//  DetailKnowledgeViewController.h
//  hypertension
//
//  Created by Yiyuan Liu on 16/9/19.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "knowledgeModel.h"

@interface DetailKnowledgeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *knowledgeTitle;
@property (strong, nonatomic) knowledgeModel *model;

@end
