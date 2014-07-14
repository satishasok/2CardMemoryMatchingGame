//
//  Card.h
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, assign, getter=isChosen) BOOL chosen;
@property (nonatomic, assign, getter=isMatched) BOOL matched;

- (NSInteger)matchWithCards:(NSArray *)otherCards;

@end
