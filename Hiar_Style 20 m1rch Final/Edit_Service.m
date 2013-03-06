//
//  Edit_Service.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Edit_Service.h"
#import "Service_Listing.h"
#import "Add_Service.h"
#import "Hiar_Style_NewAppDelegate.h"
@implementation Edit_Service


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)showdata
{
    
    
    [objdatabase ShowDataForService];
    [arrlistserviceName addObjectsFromArray:objdatabase.catchArray];
    
    
	
}
-(void)viewWillAppear:(BOOL)animated{

    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
//	[objappdel createEditableCopyOfDatabaseIfNeeded];
  
    objdatabase=[[DataBase alloc]init];
    
    
    
    arrlistserviceName=[[NSMutableArray alloc]init];
    
	[self showdata];
    [tbleditservice reloadData];
    

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBar.hidden=TRUE;
	
	
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	tbleditservice.backgroundColor=[UIColor clearColor];
	
	arr=[[NSArray alloc] initWithObjects:@"Service1",@"Service2",@"Service3",nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrlistserviceName count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellTableIdentifier = @"CellTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
	if (cell == nil) {
		
//		CGRect cellFrame = CGRectMake(0,0,300,65);
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                
		
		
		CGRect nameLabelRect = CGRectMake(250,15,200,15);
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];		
		nameLabel.tag=kNameValueTag;
		nameLabel.backgroundColor=[UIColor clearColor];
       nameLabel.font=[UIFont fontWithName:@"Arial" size:14.0];

		nameLabel.textAlignment = UITextAlignmentLeft;
		//nameLabel.font = [UIFont boldSystemFontOfSize:18];
		[cell.contentView addSubview: nameLabel];
		[nameLabel release];		
	
    
         
        
        
        
        
    
    
    }
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
 //   cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell.png"]] autorelease];

	cell.textLabel.textColor=[UIColor blackColor];
    
	UILabel *name = (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
	name.text = [NSString stringWithFormat:@"$%@",[(NSDictionary *)[arrlistserviceName objectAtIndex:indexPath.row]valueForKey:@"price"]];
    
    name.textColor=[UIColor blackColor];
    name.font=[UIFont fontWithName:@"Arial" size:14.0];
    name.font=[UIFont boldSystemFontOfSize:14];
    

	cell.textLabel.text=[(NSDictionary *)[arrlistserviceName objectAtIndex:indexPath.row]valueForKey:@"name"];
    cell.textLabel.font=[UIFont fontWithName:@"Ariral" size:14];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
    cell.textLabel.lineBreakMode=UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines=0;
  //  cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
	cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Hiar_Style_NewAppDelegate *obj=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	obj.strname=@"edit";
	obj.strservicename=[(NSDictionary *)[arrlistserviceName objectAtIndex:indexPath.row]valueForKey:@"name"];
	obj.strprice=[(NSDictionary *)[arrlistserviceName objectAtIndex:indexPath.row]valueForKey:@"price"];
	obj.strserviceid=[(NSDictionary *)[arrlistserviceName objectAtIndex:indexPath.row]valueForKey:@"id"];

	
    if(objAddService)
    {
        [objAddService release];
        
    }
    
    objAddService=[[Add_Service alloc] initWithNibName:@"Add_Service" bundle:nil];
    [self.navigationController pushViewController:objAddService animated:YES];
    
    
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

-(IBAction)done{
	[self.navigationController popViewControllerAnimated:YES];
	
}
-(IBAction)back{
	[self.navigationController popViewControllerAnimated:YES];
	

}
- (void)dealloc {
    [super dealloc];

	[arr release];
    [objdatabase release];
    [arrlistserviceName release];
    
}


@end
