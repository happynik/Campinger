//
//  MNAAdvanture+CoreDataProperties.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdvanture+CoreDataProperties.h"

@implementation MNAAdvanture (CoreDataProperties)

+ (NSFetchRequest<MNAAdvanture *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Advanture"];
}

@dynamic dateFromMe;
@dynamic dateFromPartner;
@dynamic dateToMe;
@dynamic dateToPartner;
@dynamic partnerName;
@dynamic title;
@dynamic wishes;
@dynamic places;
@dynamic items;

@end
