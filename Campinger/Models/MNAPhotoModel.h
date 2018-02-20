//
//  MNAPhotoModel.h
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNAPhotoModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *server;
@property (nonatomic) NSUInteger farm;
@property (nonatomic, copy) NSString *title;

- (instancetype)initFromJson:(NSDictionary *)json;

@end
