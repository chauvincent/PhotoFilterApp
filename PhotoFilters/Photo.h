//
//  Photo.h
//  PhotoFilters
//
//  Created by Vincent Chau on 8/2/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Photo : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Album *albumBook;

@end
