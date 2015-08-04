//
//  PictureDataTransformer.m
//  PhotoFilters
//
//  Created by Vincent Chau on 8/2/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import "PictureDataTransformer.h"

@implementation PictureDataTransformer
+(Class)transformedValueClass
{
    return [NSData class];
}

+(BOOL)allowsReverseTransformation
{
    return YES;
}

-(id)transformedValue:(id)value // uiimage to uidata
{
    return UIImagePNGRepresentation(value);
    
}
-(id)reverseTransformedValue:(id)value  //nsdata to uiimage
{
    UIImage *img = [UIImage imageWithData:value];
    return  img;
}

@end
