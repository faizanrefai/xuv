//
//  Delete_email_temp.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Delete_email_temp.h"
#import "Client_Relation.h"


@implementation Delete_email_temp
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
        
        for(char c = 'A';c<='Z';c++)
            
            [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
        
        //  NSLog(@"Header %@",toBeReturned);
    
    
    return toBeReturned;
    
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
        
        NSInteger count = 0;
        
        for(NSString *character in arrayOfCharacters)
            
        {
            
            if([character isEqualToString:title])
                
                return count;
            
            count ++;
            
        }
    
    return 0;// in case of some eror donot crash d application
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        if([arrayOfCharacters count]==0)
            
            return @"";
        else
        return [arrayOfCharacters objectAtIndex:section];
        
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
        return [arrayOfCharacters count];
   
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	     return [[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:section]]count];
        
        
        
		
	
    
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	static NSString *CellIdentifier = @"Cell";
  //  UIImageView *cellImg = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,300, 40)] autorelease];
   // [cellImg setImage:[UIImage imageNamed:@"cell.png"]];
    
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
		
     //   [cell.contentView addSubview:cellImg];  
        
        
	}
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
    
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    
	cell.textLabel.textColor=[UIColor blackColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

	cell.textLabel.text = [NSString stringWithFormat:@"%@",[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] valueForKey:@"subject"] objectAtIndex:indexPath.row]];
	return cell;
	
}
-(void)viewWillAppear:(BOOL)animated    {

    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	
	self.navigationController.navigationBar.hidden=TRUE;
    
    arrayOfCharacters =[[NSMutableArray alloc]init];
    
    
	objappdel =(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	[objappdel createEditableCopyOfDatabaseIfNeeded];
	[self showdata];
	////nslog(@"hiii");

}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//arr3=[[NSArray alloc]initWithObjects:@"Happy Birth day",@"Miss U",nil];
	//tblemailtemp.editing=TRUE;
		
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
//	
//	NSMutableArray *rowsToBeDeleted = [[NSMutableArray alloc] init];
//	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
//	int index = 0;
//	[rowsToBeDeleted addObject:[arremailtemp objectAtIndex:index]];
//	NSUInteger pathSource[2] = {0, index};
//	NSIndexPath *path1 = [NSIndexPath indexPathWithIndexes:pathSource length:2];
//	[indexPaths addObject:path1];
	

	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	int i;
	i= [[[[objectsForCharacters objectForKey:[arrayOfCharacters objectAtIndex:indexPath.section]] valueForKey:@"id"] objectAtIndex:indexPath.row]intValue];
    
	//[[(NSDictionary *)[arremailtemp objectAtIndex:indexPath.row]valueForKey:@"id"]intValue];
	//nslog(@"%d",i);
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		NSString *sql =[NSString stringWithFormat:@"delete from EMailTemp where Eid='%d'",i];
		sqlite3_stmt *statement;
		statement = nil;
		
		if(sqlite3_prepare_v2(database,[sql UTF8String], -1, &statement, NULL) == SQLITE_OK)
		{
			sqlite3_step(statement); 
		}
		
		sqlite3_finalize(statement);
		
		
		sqlite3_close(database);
		
	} 
	[self showdata];
    
//		
//	for (id value in rowsToBeDeleted)
//	{
//		[arremailtemp removeObject:value];
//	}
//	
//	[tblemailtemp deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
//	
//	
//	
//	[rowsToBeDeleted release];
//    [indexPaths release];
    
}


-(IBAction)edit{
	tblemailtemp.editing=TRUE;
	
}

-(IBAction)selectAll:(id)sender{
	
	
}



-(IBAction)buttonClicked1:(id)sender{
	[self.navigationController popViewControllerAnimated:YES];
    
		
}



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

-(void)showdata{
    
    [objappdel  createEditableCopyOfDatabaseIfNeeded];
    
    
    arremailtemp=nil;
    
	arremailtemp=[[NSMutableArray alloc]init];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	
    
    objectsForCharacters = [[NSMutableDictionary alloc]init];
	
    for(char c='A';c<='Z';c++)
        
    {
        arremailtemp=[[NSMutableArray alloc]init];
        NSMutableString *query;
        
        query = [NSMutableString stringWithFormat:@"where Subject LIKE '%c",c];
        
        [query appendString:@"%'"];
        
        if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
        {
            static sqlite3_stmt *statement;
            statement = nil;
            NSString *s = [NSString stringWithFormat:@"select * from EMailTemp %@",query];
            //////nslog(@"%@",s);
            
            if(sqlite3_prepare_v2(database, [s UTF8String], -1, &statement, NULL) == SQLITE_OK)
            {
                while(sqlite3_step(statement) == SQLITE_ROW)
                {
                    // Read the data from the result row
                    
                    temp =[[NSMutableDictionary alloc]init];
                    if((char *)sqlite3_column_text(statement, 0)!=NULL){
                        
                        
                        
                        [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] forKey:@"id"];
                    }
                    if((char *)sqlite3_column_text(statement, 1)!=NULL){
                        
                        
                        
                        [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] forKey:@"subject"];
                    }
                    if((char *)sqlite3_column_text(statement, 2)!=NULL){
                        
                        
                        [temp setValue:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)] forKey:@"message"];
                    }				
                    [arremailtemp addObject:temp];
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
        
        
        
        //   [arrlistname addObject:objdatabase.catchArray];
        
        if([arremailtemp  count] >0)
            
        {
            
            [arrayOfCharacters addObject:[NSString stringWithFormat:@"%c",c]];
            
            
            
            [objectsForCharacters setObject:arremailtemp  forKey:[NSString stringWithFormat:@"%c",c]];
            
            
            
            
        }
        [arremailtemp release];
        
    }
    
    if([objectsForCharacters count]>0)
    {
        btnEdit.enabled=TRUE;
        
    }
    else{
        btnEdit.enabled=FALSE;
        
        
    }
    [tblemailtemp reloadData];
    
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];

	[arremailtemp release];
	
	[temp release];
	[arr3 release];
}


@end
