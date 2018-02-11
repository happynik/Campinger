//
//  MNAWish+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 11.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAWish+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAWish (CoreDataProperties)

+ (NSFetchRequest<MNAWish *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageUrl;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
