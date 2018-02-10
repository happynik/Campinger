//
//  MNAAdventureItem+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdventureItem+CoreDataProperties.h"

@implementation MNAAdventureItem (CoreDataProperties)

+ (NSFetchRequest<MNAAdventureItem *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AdventureItem"];
}

@dynamic title;
@dynamic begin;
@dynamic end;
@dynamic details;
@dynamic type;

@end
