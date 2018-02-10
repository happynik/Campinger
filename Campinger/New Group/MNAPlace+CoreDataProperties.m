//
//  MNAPlace+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAPlace+CoreDataProperties.h"

@implementation MNAPlace (CoreDataProperties)

+ (NSFetchRequest<MNAPlace *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Place"];
}

@dynamic likeCount;
@dynamic dislikeCount;
@dynamic title;
@dynamic imageUrl;

@end
