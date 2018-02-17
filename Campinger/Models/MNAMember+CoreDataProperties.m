//
//  MNAMember+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAMember+CoreDataProperties.h"

@implementation MNAMember (CoreDataProperties)

+ (NSFetchRequest<MNAMember *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Member"];
}

@dynamic dateFrom;
@dynamic dateTo;
@dynamic name;
@dynamic places;
@dynamic wishes;

@end
