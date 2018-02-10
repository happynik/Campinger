//
//  MNAPlace+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAPlace+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAPlace (CoreDataProperties)

+ (NSFetchRequest<MNAPlace *> *)fetchRequest;

@property (nonatomic) int32_t likeCount;
@property (nonatomic) int32_t dislikeCount;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
