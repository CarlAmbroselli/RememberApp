//
//  Media+Create.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "Media+Create.h"

@implementation Media (Create)

+(Media *)mediaWithDict:(NSDictionary *)dict inManagedObjectContext:(NSManagedObjectContext *)context
{
    Media *media = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Media"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"id == %@", dict[@"mediaId"]];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if(!matches || ([matches count] > 1)) {
        //handle error
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    } else if (![matches count]) {
        media = [NSEntityDescription insertNewObjectForEntityForName:@"Media" inManagedObjectContext:context];
        media.id = dict[@"mediaId"];
    } else {
        media = [matches lastObject];
    }
    
    media.fileName = dict[@"fileName"];
    
    return media;
}

@end
