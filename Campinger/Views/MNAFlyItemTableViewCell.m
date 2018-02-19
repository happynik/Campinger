//
//  MNAFlyItemTableViewCell.m
//  Campinger
//
//  Created by Nikita Moiseev on 17.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import <Masonry/Masonry.h>
#import "MNAFlyItemTableViewCell.h"
#import "MNAAdventureItem+CoreDataProperties.h"


@interface MNAFlyItemTableViewCell ()

@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *fromCityLabel;

@property (nonatomic, strong) UILabel *toLabel;
@property (nonatomic, strong) UILabel *toCityLabel;

@end


@implementation MNAFlyItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor orangeColor];
        
        _fromLabel = [UILabel new];
        _fromLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_fromLabel];
        
        _toLabel = [UILabel new];
        _toLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_toLabel];
        
        [self updateConstraints];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@synthesize flightItem = _flightItem;
- (void)setFlightItem:(MNAAdventureItem *)value
{
    _flightItem = value;
    [self p_setLabel:self.fromLabel WithText:@"Вылет: " Date:value.begin];
    [self p_setLabel:self.toLabel WithText:@"Прилет: " Date:value.end];
}

- (void)p_setLabel:(UILabel *)label WithText:(NSString *)text Date:(NSDate *)date
{
    if (!date)
    {
        label.text = text;
        return;
    }
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"HH:mm";
    label.text = [NSString stringWithFormat:@"%@ %@", text, [formatter stringFromDate:date]];
}

- (void)updateConstraints
{
    UIEdgeInsets labelPadding = UIEdgeInsetsMake(10, 20, 10, 20);
    
    [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(labelPadding.top);
        make.left.equalTo(self.contentView.mas_left).offset(labelPadding.left);
        make.right.equalTo(self.contentView.mas_right).offset(-labelPadding.right);
    }];
    [_toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fromLabel.mas_bottom).offset(labelPadding.top);
        make.left.equalTo(self.contentView.mas_left).offset(labelPadding.left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-labelPadding.bottom);
        make.right.equalTo(self.contentView.mas_right).offset(-labelPadding.right);
    }];
    
    [super updateConstraints];
}

@end
