//
//  CIExportController.m
//  Cookie
//
//  Created by Simon Relet on 08/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIExportController.h"

@implementation CIExportController

@synthesize textField;
@synthesize textLabel;
@synthesize recipeList;
@synthesize recipeName;
@synthesize window;
@synthesize sheet;
@synthesize destinationDirectory;

-(IBAction)open:(id)sender {
    if (-1 == recipeList.selectedRow)
        return;
    
    CIRecipeDataSource *dataSourceRecipe = (CIRecipeDataSource*)recipeList.dataSource;
    CIRecipe *selectedRecipe = [dataSourceRecipe tableView:recipeList objectValueForTableColumn:recipeList.highlightedTableColumn row:recipeList.selectedRow];
    
    self.destinationDirectory = @"";
    self.recipeName.stringValue = [selectedRecipe Name];
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [self.textLabel setTextColor:[NSColor controlTextColor]];
    self.textField.stringValue = @"";
    self.destinationDirectory = @"";
    self.recipeName.stringValue = @"";
    
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

-(IBAction)openDialog:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:NO];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    
    if ([openDlg runModal] == NSOKButton) {
        NSArray* files = [openDlg filenames];
        NSString* fileName = [files objectAtIndex:0];
        self.textField.stringValue = fileName;
        self.destinationDirectory = fileName;
    }
}

-(IBAction)exportRecipe:(id)sender {
    NSString *directoryPath = [[NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Cookie"];
    
    if ([[self destinationDirectory] isEqualToString:@""]) {
        [self.textLabel setTextColor:[NSColor redColor]];
        return;
    }
    
    CIRecipeDataSource *dataSourceRecipe = (CIRecipeDataSource*)recipeList.dataSource;
    CIRecipe *selectedRecipe = [dataSourceRecipe tableView:recipeList objectValueForTableColumn:recipeList.highlightedTableColumn row:recipeList.selectedRow];
    
    NSString *outputName = [[[selectedRecipe Name] stringByReplacingOccurrencesOfString:@" " withString:@"_"] stringByAppendingPathExtension:@"meal"];
    
    NSString *fileName = [directoryPath stringByAppendingPathComponent:outputName];

    if ([[NSFileManager defaultManager] isReadableFileAtPath:fileName])
        if (![[NSFileManager defaultManager] copyItemAtPath:fileName toPath:[[self destinationDirectory] stringByAppendingPathComponent:outputName] error:nil])
            NSLog(@"Error while coping file in import");
    
    [self close:sender];
}

@end
