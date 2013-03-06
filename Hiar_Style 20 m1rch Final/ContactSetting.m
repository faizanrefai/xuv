//
//  ContactSetting.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactSetting.h"
#import "SettingHome.h"

@implementation ContactSetting

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
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"Contact Setting";
			
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section  {


if(section==0)
{

return  @"Contacts";
    

}
else{

    return  @"Groups";



}


}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(section==0) {
		return 3;
		
	}
	
	else{
	return 2;
	}
	

}


-(IBAction)click{
	[self.navigationController popViewControllerAnimated:YES];
    

}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    
   
		CGRect nameLabelRect = CGRectMake(170,15,100,15);
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];		
		nameLabel.tag=kNameValueTag2;
		nameLabel.backgroundColor=[UIColor clearColor];
		nameLabel.textColor=[UIColor blackColor];
        
		nameLabel.textAlignment = UITextAlignmentLeft;
		nameLabel.font = [UIFont fontWithName:@"Arial" size:14];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //[cell.superview addSubview:nameLabel];
        
        [cell.contentView addSubview:nameLabel];
       // [cell bringSubviewToFront:nameLabel];
        
        [nameLabel release];		
    }
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:14.0];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14.0];

//    cell.backgroundColor=[UIColor clearColor];
    
    UILabel *name = (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
[cell bringSubviewToFront:name];
    name.textColor=[UIColor blueColor];
    
	//cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
	if(indexPath.section==1) {
		switch (indexPath.row) {
				
			case 0:
				cell.textLabel.text=@"All Contacts on iPhone";
				
                break;
			case 1:
				cell.textLabel.text=@"HairWorx contacts only";
               
                break;
				
			default:
				break;
		}
        
        if([[[NSUserDefaults standardUserDefaults] valueForKey:@"ContactDisplay"] isEqualToString:@"HairWorx"])
        {
            if(indexPath.row==1)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;  
            }
            else{
            
                cell.accessoryType = UITableViewCellAccessoryNone;  
            }
        }
        else{
            if(indexPath.row==0)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;  
            }
            else{
                cell.accessoryType = UITableViewCellAccessoryNone;  
            }
        }
}	
  	if(indexPath.section==0){
		
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        name.textAlignment=UITextAlignmentRight;
        
    switch (indexPath.row) {
		case 0:
			cell.textLabel.text=@"Sort order";
            name.text=@"Last, First";
            
			break;
		case 1:
			cell.textLabel.text=@"Display order";
			name.text=@"First, Last";
            
            break;
		case 2:
			cell.textLabel.text=@"Default account";
			name.text=@"On my iPhone";
            break;
			
		default:
			break;
	}
	}
	return cell;
	// Configure the cell.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  
{
    if(indexPath.section==1) {
    
                      if(indexPath.row==0)
                {
            [[NSUserDefaults standardUserDefaults] setValue:@"IPhone" forKey:@"ContactDisplay"];
            [[NSUserDefaults standardUserDefaults] synchronize];
                }
            else{
            
                [[NSUserDefaults standardUserDefaults] setValue:@"HairWorx" forKey:@"ContactDisplay"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                }
    }
    [tblcontactset reloadData];
    


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
}


@end
