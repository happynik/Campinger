//
//  MNAWishCollectionViewCell.h
//  Campinger
//
//  Created by Nikita Moiseev on 06.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNAWishCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *name;

- (void) highlightForSelected;
- (void) highlightForDeselected;

@end
