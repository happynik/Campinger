//
//  WishesManager.h
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MNAWishesServiceProtocol

/*
 Возвращает список всех желаний
 */
@property (nonatomic, strong) NSArray *AllWishes;

@end

@interface MNAWishesService : NSObject <MNAWishesServiceProtocol>

@end
