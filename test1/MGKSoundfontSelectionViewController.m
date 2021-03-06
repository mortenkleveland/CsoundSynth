//
//  MGKSoundfontSelectionViewController.m
//  test1
//
//  Created by Morten Kleveland on 18.04.14.
//  Copyright (c) 2014 NTNU. All rights reserved.
//

#import "MGKSoundfontSelectionViewController.h"

@interface MGKSoundfontSelectionViewController ()

@property (nonatomic, strong) NSMutableArray* soundfontPresetArray;

@end

@implementation MGKSoundfontSelectionViewController

@synthesize mainViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.soundfontPresetArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 256; i++) {
        NSString *str = [@(i) stringValue];
        [self.soundfontPresetArray addObject:str];
    }
    // Do any additional setup after loading the view.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInViewTableView:(UITableView*)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Soundfonts";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.soundfontPresetArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"soundfontCell"; // Attempt to request the reusable cell.
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // No cell available - create one.
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.soundfontPresetArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isEqual:mainViewController.soundfontOscillator1SelectionViewController]) {
        [mainViewController changeOscillator1SoundfontInstrumentTo:[self.soundfontPresetArray objectAtIndex:indexPath.row]];
    } else if ([self isEqual:mainViewController.soundfontOscillator2SelectionViewController]) {
        [mainViewController changeOscillator2SoundfontInstrumentTo:[self.soundfontPresetArray objectAtIndex:indexPath.row]];
    }
}

@end
