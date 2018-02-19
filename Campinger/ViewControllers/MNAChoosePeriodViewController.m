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
    
    [self p_setConstraints];
}

- (void)p_setConstraints
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
