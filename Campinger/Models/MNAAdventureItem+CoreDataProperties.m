//
//  MNAAdventureItem+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdventureItem+CoreDataProperties.h"

@implementation MNAAdventureItem (CoreDataProperties)

+ (NSFetchRequest<MNAAdventureItem *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AdventureItem"];
}

@dynamic begin;
@dynamic details;
@dynamic end;
@dynamic title;
@dynamic type;

@end
