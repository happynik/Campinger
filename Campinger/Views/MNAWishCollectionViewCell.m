//
//  MNAWishCollectionViewCell.m
//  Campinger
//
//  Created by Nikita Moiseev on 06.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
#import <Masonry/Masonry.h>

#import "MNAWishCollectionViewCell.h"
#import "UIImage+MNAImageExtensions.h"

@interface MNAWishCollectionViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *image;

@end

@implementation MNAWishCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //_image = [[UIImageView alloc] initWithImage:[UIImage mna_imageNamed:@"surf_default" scaledToSize:CGSizeMake(100, 100)]];
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"surf_default"]];
        [self.contentView addSubview:_image];
        
        _nameLabel = [UILabel new];
        _nameLabel.text = @"";
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_nameLabel];
        
        [self updateConstraints];
    }
    
    return self;
}

- (void) setName:(NSString *)name
{
    _name = name;
    _nameLabel.text = _name;
}

- (void) highlightForSelected
{
    self.backgroundColor = [UIColor blueColor];
}

- (void) highlightForDeselected
{
    self.backgroundColor = [UIColor whiteColor];
}

- (void) updateConstraints
{
    UIEdgeInsets imagePadding = UIEdgeInsetsMake(10, 10, 10, 10);
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(imagePadding);
    }];
    
    UIEdgeInsets labelPadding = UIEdgeInsetsMake(10, 10, 10, 10);
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_image.mas_top).with.offset(labelPadding.top);
        make.left.equalTo(_image.mas_left).with.offset(labelPadding.left);
    }];
    
    [super updateConstraints];
}

@end
