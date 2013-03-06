//
//  Add_Colorline.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Add_Colorline.h"
#import "ColorLIne.h"


@implementation Add_Colorline

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
	self.navigationController.navigationBar.tintColor=[UIColor blackColor];
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	self.navigationController.navigationBar.hidden=TRUE;
	objdatabase=[[DataBase alloc]init];
    
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
-(IBAction)done:(id)sender{
	
	
	if([txtcolorname.text isEqualToString:@""])
		
	{
	
		UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Color Name" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert1 show];
		[alert1 release];
		
	
	}
	
	
	[objdatabase InsertIntoColorLine:txtcolorname.text];
   
    

	txtcolorname.text=@"";
	
	[txtcolorname resignFirstResponder];
	
	

}
-(IBAction)click{

}
-(IBAction)back{
    
	[txtcolorname resignFirstResponder];
	
	[self.navigationController popViewControllerAnimated:YES];
    

}
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
     [objdatabase release];
    
}


@end
