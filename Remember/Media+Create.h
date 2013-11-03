//
//  Media+Create.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "Media.h"

@interface Media (Create)

+(Media *)mediaWithDict:(NSDictionary *)dict inManagedObjectContext:(NSManagedObjectContext *)context;

@end
