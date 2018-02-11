//
//  MNAPlace+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 11.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAPlace+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAPlace (CoreDataProperties)

+ (NSFetchRequest<MNAPlace *> *)fetchRequest;

@property (nonatomic) int32_t dislikeCount;
@property (nullable, nonatomic, copy) NSString *imageUrl;
@property (nonatomic) int32_t likeCount;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
