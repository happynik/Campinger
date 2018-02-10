//
//  MNAMember+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAMember+CoreDataProperties.h"

@implementation MNAMember (CoreDataProperties)

+ (NSFetchRequest<MNAMember *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Member"];
}

@dynamic name;
@dynamic dateFrom;
@dynamic dateTo;
@dynamic wishes;
@dynamic places;

@end
