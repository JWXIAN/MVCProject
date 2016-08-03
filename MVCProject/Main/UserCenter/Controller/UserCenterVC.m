//
//  UserCenterVC.m
//  MVCProject
//
//  Created by GJW on 16/7/28.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "UserCenterVC.h"
#import "UserCenterGiftCell.h"
#import "UserCenterInfoCell.h"
#import "HomeVC.h"
#import "UINavigationBar+Awesome.h"
#import "UserCenterHeadCell.h"

@interface UserCenterVC ()<UITableViewDelegate, UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation UserCenterVC

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource =self;
        self.tableView.tableFooterView = [UIView new];
        self.tableView.backgroundColor = [UIColor whiteColor];
        UIImageView *image = [[UIImageView alloc] initWithFrame:self.tableView.bounds];
        image.image = [UIImage imageNamed:@"a"];
        [self.tableView setBackgroundView:image];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        UserCenterHeadCell *cell = [UserCenterHeadCell cellWithTableView:tableView];
        return cell;
    }else if (indexPath.row==1){
        UserCenterInfoCell *cell = [UserCenterInfoCell cellWithTableView:tableView];
        return cell;
    }else{
        UserCenterGiftCell *cell = [UserCenterGiftCell cellWithTableView:tableView];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeVC *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row==0?100:44;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;//导航栏的背景色是黑色, 字体为白色
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];//用于去除导航栏的底线，也就是周围的边线
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar lt_reset];
}
@end
