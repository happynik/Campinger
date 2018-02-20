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
@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation MNAWishCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"surf_default"]];
        [self.contentView addSubview:_imageView];
        
        _nameLabel = [UILabel new];
        _nameLabel.text = @"";
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_nameLabel];
        
        [self updateConstraints];
    }
    
    return self;
}

- (void)setName:(NSString *)name
{
    _name = name;
    self.nameLabel.text = _name;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = _image;
}

- (void)highlightForSelected
{
    self.backgroundColor = [UIColor blueColor];
}

- (void)highlightForDeselected
{
    self.backgroundColor = [UIColor whiteColor];
}

- (void)updateConstraints
{
    UIEdgeInsets imagePadding = UIEdgeInsetsMake(10, 10, 10, 10);
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(imagePadding);
    }];
    
    UIEdgeInsets labelPadding = UIEdgeInsetsMake(10, 10, 10, 10);
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_top).with.offset(labelPadding.top);
        make.left.equalTo(_imageView.mas_left).with.offset(labelPadding.left);
    }];
    
    [super updateConstraints];
}

@end
