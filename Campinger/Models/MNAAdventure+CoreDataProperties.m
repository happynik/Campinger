//
//  MNAAdventure+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdventure+CoreDataProperties.h"

@implementation MNAAdventure (CoreDataProperties)

+ (NSFetchRequest<MNAAdventure *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Adventure"];
}

@dynamic title;
@dynamic adventureItems;
@dynamic members;

@end
