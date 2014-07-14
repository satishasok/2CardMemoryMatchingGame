//
//  CardGameViewController.m
//  CardGame
//
//  Created by Satish Asok on 7/12/14.
//  Copyright (c) 2014 Satish Asok. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardGame2CardMatchingGame.h"


@interface CardGameViewController ()

@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;
@property (strong, nonatomic) CardGame2CardMatchingGame *matchingGame;

@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;


@property (nonatomic, assign) NSInteger flipCount;

@end

@implementation CardGameViewController

- (PlayingCardDeck *)playingCardDeck
{
    if (_playingCardDeck == nil) {
        _playingCardDeck = [[PlayingCardDeck alloc] init];
    }
    
    return _playingCardDeck;
}

- (CardGame2CardMatchingGame *)matchingGame
{
    if (!_matchingGame) {
        _matchingGame = [[CardGame2CardMatchingGame alloc] initWithCards:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    
    return _matchingGame;
}

- (void)setFlipCount:(NSInteger)flipCount
{
    _flipCount = flipCount;
    [self.flipCountLabel setText:[NSString stringWithFormat:@"Flip Count: %ld", (long)_flipCount]];
}

- (IBAction)touchedCardButton:(UIButton *)sender
{
    
    NSInteger choosenButtonIndex = [self.cardButtons indexOfObject:sender];
    
    if (choosenButtonIndex >= 0) {
        [self.matchingGame chooseCardAtIndex:choosenButtonIndex];
        [self updateUI];
    }
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.matchingGame cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:card.isChosen ? card.contents : @"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    [self.flipCountLabel setText:[NSString stringWithFormat:@"Flip Count: %ld", (long)self.matchingGame.flipCount]];
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %ld", (long)self.matchingGame.score]];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
