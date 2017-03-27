//
//  HomeViewController.m
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/20.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "CDMNetworkManager.h"
#import "knowledgeModel.h"
#import "DetailKnowledgeViewController.h"
#import "UserManager.h"
#import <AVOSCloud/AVOSCloud.h>


static NSString * const LogoutNotification = @"LogoutNotification";

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>

@property (weak, nonatomic) SDCycleScrollView *cycleView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *knowledgeArray;


@end

static NSString * const bpTitle = @"血压记录";
static NSString * const weightTitle = @"体重记录";
static NSString * const medicineTitle = @"服药记录";

typedef enum : NSInteger {
    kBloodPressure = 0,
    kWeight = 1,
    kMedicine = 2,
} Index;


@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.contentInset = UIEdgeInsetsZero;
    
    [self fetchTopKnowledge];
    
//    [self testLeanCloud];

}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];  // clear extra table view cell
    if (!self.cycleView) {
        self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 240) delegate:self placeholderImage:nil];
        self.cycleView.delegate = self;
        self.cycleView.autoScrollTimeInterval = 5;
        self.cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        [self.view addSubview:self.cycleView];
    }
}

- (void)fetchTopKnowledge{
    [[CDMNetworkManager sharedManager] getURLString:@"health-knowledge/NewestKnoService.jsp" parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            //NSLog(@"%@",resposeObject);
            NSMutableArray *urlArray = [[NSMutableArray alloc] init];
            NSMutableArray *titleArray = [[NSMutableArray alloc] init];
            for (NSDictionary *knowledge in responseObject[@"result"][@"knowledge"]) {
                [urlArray addObject:knowledge[@"kno_link"]];
                [titleArray addObject:knowledge[@"kno_name"]];
                
                knowledgeModel *model = [[knowledgeModel alloc] init];
                model.knowledgeId = [knowledge[@"kno_id"] integerValue];
                model.name = knowledge[@"kno_name"];
                model.subtitle = knowledge[@"kno_dis"];
                model.time = [knowledge[@"kno_time"] substringToIndex:[knowledge[@"kno_time"] length] - 2];
                model.link = knowledge[@"kno_link"];
                [self.knowledgeArray addObject:model];
            }
            self.cycleView.imageURLStringsGroup = urlArray;
            self.cycleView.titlesGroup = titleArray;
        }
    } failure:^(NSURLSessionTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"HomeCell"];
    }
    switch (indexPath.row) {
        case kBloodPressure: {
            cell.textLabel.text = bpTitle;
//            cell.textLabel.font = [UIFont fontWithName: @"Arial" size:22.0 ];
            cell.textLabel.textColor = [UIColor colorWithRed:255.0/255 green:101.0/255 blue:101.0/255 alpha:1];
            cell.detailTextLabel.text = @"test";
            UIImage *icon = [UIImage imageNamed:@"pressure_512px.png"];
            CGSize itemSize = CGSizeMake(36, 36);//固定图片大小为36*36
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
            [icon drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"right_arrow_red.png"]];
            [cell.accessoryView setFrame:CGRectMake(0, 0, 16, 16)];
        }
            break;
        case kWeight: {
            cell.textLabel.text = weightTitle;
            cell.textLabel.textColor = [UIColor colorWithRed:61.0/255 green:204.0/255 blue:61.0/255 alpha:1];

            cell.detailTextLabel.text = @"test";
            UIImage *icon = [UIImage imageNamed:@"weight_550px.png"];
            CGSize itemSize = CGSizeMake(36, 36);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
            [icon drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"right_arrow_green.png"]];
            [cell.accessoryView setFrame:CGRectMake(0, 0, 16, 16)];
        }
            break;
        case kMedicine: {
            cell.textLabel.text = medicineTitle;
            cell.textLabel.textColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:200.0/255 alpha:1];

            cell.detailTextLabel.text = @"test";
            UIImage *icon = [UIImage imageNamed:@"book_300px_.png"];
            CGSize itemSize = CGSizeMake(36, 36);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
            [icon drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"right_arrow_blue.png"]];
            [cell.accessoryView setFrame:CGRectMake(0, 0, 16, 16)];
        }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == kMedicine) {
        [[NSNotificationCenter defaultCenter] postNotificationName:LogoutNotification object:nil];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

#pragma mark - CycleViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    [self pushToKnowledgeWithModel:self.knowledgeArray[index]];
}

- (NSMutableArray *)knowledgeArray{
    if (!_knowledgeArray) {
        _knowledgeArray = [[NSMutableArray alloc] init];
    }
    return _knowledgeArray;
}

- (void)pushToKnowledgeWithModel:(knowledgeModel *)model{
    DetailKnowledgeViewController *dVC = [[DetailKnowledgeViewController alloc] init];
    dVC.hidesBottomBarWhenPushed = YES;
    dVC.model = model;
    UINavigationController *nav = self.navigationController;
    nav.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        [nav pushViewController:dVC animated:YES];
    });
}

#pragma mark - Test
- (void)testLeanCloud {
    NSString *leanCloudId = [UserManager manager].user.leanCloudId;
    AVUser *user = [AVUser objectWithObjectId:leanCloudId];
    AVObject *bp = [AVObject objectWithClassName:@"BloodPressure"];
    [bp setObject:@120 forKey:@"sys"];
    [bp setObject:@80 forKey:@"dia"];
    [bp setObject:@70 forKey:@"heartRate"];
    [bp setObject:user forKey:@"patient"];
    [bp setObject:@"some note" forKey:@"note"];
    [bp saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"save succeeded");
        }
    }];
}


@end
