//
//  HomeVC.m
//  MVCProject
//
//  Created by GJW on 16/7/20.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "HomeVC.h"
#import "HomeCell.h"
#import "UserCenterVC.h"

@interface HomeVC ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(leftClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(rightClick)];
    [self ldTableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)ldTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (void)leftClick{
    
}
- (void)rightClick{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [HomeCell cellWithTableView:tableView];
    cell.imageV.image = [UIImage imageNamed:indexPath.row%2?@"a":@"b"];
    cell.lblDetail.text = indexPath.row%2?@"欣赏和喜欢你拥有的东西，而不是你没有的东西，你才能快乐。":@"一个人把情感统统拿出来，就像把钱统统败光了一样得不到人家怜悯。";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserCenterVC *userCenter = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"UserCenterVC"];
    [self.navigationController pushViewController:userCenter animated:YES];
}

#pragma mark - 隐藏顶部导航
float lastContentOffset;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    lastContentOffset = scrollView.contentOffset.y;
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if (lastContentOffset < scrollView.contentOffset.y) {
        [super.navigationController setNavigationBarHidden:YES animated:true];
    }else{
        [super.navigationController setNavigationBarHidden:NO animated:true];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.hidesBottomBarWhenPushed=YES;
}
@end
