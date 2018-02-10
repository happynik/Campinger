//
//  MNAWish+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAWish+CoreDataProperties.h"

@implementation MNAWish (CoreDataProperties)

+ (NSFetchRequest<MNAWish *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Wish"];
}

@dynamic imageUrl;
@dynamic name;

@end
