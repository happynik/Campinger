//
//  MNAPhotosModel.h
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNAPhotosModel : NSObject

@property (nonatomic, strong) NSArray *photos;

- (instancetype)initFromJson:(NSDictionary *)json;

@end
