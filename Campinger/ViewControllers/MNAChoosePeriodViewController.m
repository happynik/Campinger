//
//  MNAChoosePeriodViewController.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "MNAChoosePeriodViewController.h"

@interface MNAChoosePeriodViewController ()

@property (nonatomic, strong) UITextField *fromDate;
@property (nonatomic, strong) UITextField *toDate;

@end

@implementation MNAChoosePeriodViewController

//https://github.com/patchthecode/JTAppleCalendar

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.fromDate = [[UITextField alloc] init];
//    self.fromDate.layer.borderColor = [UIColor blackColor].CGColor;
//    self.fromDate.layer.borderWidth = 1;
//    self.fromDate.layer.cornerRadius = 5.0;
    //[self.view addSubview:self.fromDate];
    
//    self.toDate = [UITextField new];
//    [self.view addSubview:self.toDate];
    
    [self p_setConstraints];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) p_setConstraints
{
    UIEdgeInsets padding = UIEdgeInsetsMake(40, 20, 40, 20);
    
    [self.fromDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(padding.top);
        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
        make.right.equalTo(self.view.mas_right).with.offset(padding.right);
    }];
    
    [self.toDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fromDate).with.offset(padding.top);
        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(padding.bottom);
        make.right.equalTo(self.view.mas_right).with.offset(padding.right);
    }];
}

@end
