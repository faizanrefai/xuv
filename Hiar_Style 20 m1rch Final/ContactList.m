//
//  ContactList.m
//  Hiar_Style_New
//
//  Created by apple on 12/20/11.
//  Copyright 2011 354456. All rights reserved.
//

#import "ContactList.h"


@implementation ContactList
@synthesize catchArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}
-(void)showdata
{
	
	self.catchArray=[[NSMutableArray alloc]init];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		static sqlite3_stmt *statement;
		statement = nil;
		NSString *s = [NSString stringWithFormat:@"SELECT * FROM AddClient"];
		
		if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
				// Read the data from the result row
				
				temp =[[NSMutableDictionary alloc]init];
                
				[temp setValue:[NSString stringWithFormat:@"%d",sqlite3_column_int(statement, 0)] forKey:@"id"];
                if((char *)sqlite3_column_text(statement, 2)!=NULL){
                    
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"name"];
                }
                
                if((char *)sqlite3_column_text(statement, 8)!=NULL){
                    
					[temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)] forKey:@"Email"];
                }
                
                
				[self.catchArray addObject:temp];
				[temp release];
				temp=nil;
			}
			
		}
		else
		{
			NSAssert1(0, @"Error while Execute statement. '%s'", sqlite3_errmsg(database));
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}		
	
	
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar

{
    
    // only show the status bar’s cancel button while in edit mode
    
    search.showsCancelButton = YES;
    
    search.autocorrectionType = UITextAutocorrectionTypeNo;
    
    // flush the previous search content
    
    // [catchArray removeAllObjects];
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar

{
    
    search.showsCancelButton = NO;
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [search resignFirstResponder];
    
    
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catchArray count];
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [search resignFirstResponder];
    return YES;
    
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
  //  UIImageView *cellImg = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,300, 40)] autorelease];
    //[cellImg setImage:[UIImage imageNamed:@"DireCellImage.png"]];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
      //  [cell.contentView addSubview:cellImg];  
        
    }
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17];
    
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    
    
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
	cell.textLabel.text=[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"name"];
	// Configure the cell.
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//objappdel.idvalue=[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"id"];
   objappdel.strselectemail=[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"Email"];
      
//    
//    objappdel.window.rootViewController = objappdel.tabmainsub;
    [self dismissModalViewControllerAnimated:YES];

    
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)viewWillAppear:(BOOL)animated    {
    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [self showdata];
    
    [tblDire reloadData];
    
}
-(IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
