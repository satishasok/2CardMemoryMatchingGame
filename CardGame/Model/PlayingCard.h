//
//  PlayingCard.h
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, assign) NSUInteger rank;

- (id)initWithRank:(NSUInteger)rank suit:(NSString *)suit;

- (NSString *)rankString;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
