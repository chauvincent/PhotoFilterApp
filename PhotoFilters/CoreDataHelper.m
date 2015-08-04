//
//  CoreDataHelper.m
//  PhotoFilters
//
//  Created by Vincent Chau on 8/1/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper



+(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    //test to make sure delegate responds to managedobjectcontext
    //confirm variable exists
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
