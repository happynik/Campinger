//
//  MNAFlyItemTableViewCell.h
//  Campinger
//
//  Created by Nikita Moiseev on 17.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MNAAdventureItem;

@interface MNAFlyItemTableViewCell : UITableViewCell

@property (nonatomic, strong) MNAAdventureItem *flightItem;

@end
