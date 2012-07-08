//
//  CIImportController.m
//  Cookie
//
//  Created by Simon Relet on 06/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIImportController.h"

@implementation CIImportController

@synthesize textField;
@synthesize textLabel;
@synthesize recipeList;
@synthesize window;
@synthesize sheet;
@synthesize fileToImport;

-(IBAction)open:(id)sender {
    self.fileToImport = @"";
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [self.textLabel setTextColor:[NSColor controlTextColor]];
    self.textField.stringValue = @"";
    self.fileToImport = @"";
    
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

-(IBAction)openDialog:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:NO];
    [openDlg setAllowsMultipleSelection:NO];

    NSArray *fileTypes = [[NSArray alloc] initWithObjects:@"meal", nil];
    [openDlg setAllowedFileTypes:fileTypes];

    if ([openDlg runModal] == NSOKButton) {
        NSArray* files = [openDlg filenames];
        NSString* fileName = [files objectAtIndex:0];
        self.textField.stringValue = fileName;
        //NSLog(@"%@", fileName);
        //NSString *newFileName = [directoryPath stringByAppendingPathComponent:[fileName lastPathComponent]];
        //NSLog(@"%@", newFileName);
        self.fileToImport = fileName;
        
        //if ([[NSFileManager defaultManager] isReadableFileAtPath:fileName])
         //if (![[NSFileManager defaultManager] copyItemAtPath:fileName toPath:newFileName error:nil])
            //NSLog(@"NO");
        //[self close:sender];
    }
}

-(IBAction)import:(id)sender {
    NSString *directoryPath = [[NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Cookie"];
    
    if ([[self fileToImport] isEqualToString:@""]) {
        [self.textLabel setTextColor:[NSColor redColor]];
        return;
    }
    
    NSString *newFileName = [directoryPath stringByAppendingPathComponent:[[self fileToImport] lastPathComponent]];
    if ([[NSFileManager defaultManager] isReadableFileAtPath:[self fileToImport]])
        if (![[NSFileManager defaultManager] copyItemAtPath:[self fileToImport] toPath:newFileName error:nil])
            NSLog(@"Error while coping file in import");
    
    CIRecipeDataSource *dataSource = (CIRecipeDataSource*)[self.recipeList dataSource];
    [dataSource loadRecipe];
    [self.recipeList reloadData];
    
    [self close:sender];
}

@end
