//
//  Edit_Directory.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Edit_Directory.h"

#import "HomeDire.h"
@implementation Edit_Directory
@synthesize tblDire;
@synthesize countries;
@synthesize selectedArray;
@synthesize inPseudoEditMode;
@synthesize selectedImage;
@synthesize unselectedImage;



-(IBAction)doDelete
{
	NSMutableArray *rowsToBeDeleted = [[NSMutableArray alloc] init];
	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
	int index = 0;
	for (NSNumber *rowSelected in selectedArray)
	{
		if ([rowSelected boolValue])
		{
			
			[rowsToBeDeleted addObject:[countries objectAtIndex:index]];
			NSUInteger pathSource[2] = {0, index};
			NSIndexPath *path1 = [NSIndexPath indexPathWithIndexes:pathSource length:2];
			[indexPaths addObject:path1];
			
			NSString *i;
			i= [(NSDictionary *)[self.countries objectAtIndex:index]valueForKey:@"id"];
			
			
			
			
			fileName=[(NSDictionary *)[self.countries objectAtIndex:index]valueForKey:@"image"];
			NSLog(@"df%@",fileName);
			
			
            if(fileName==nil)
				
				
            {
				
            }
            else {
                
                
                NSFileManager *fileManager = [NSFileManager defaultManager];
                
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
                
                NSString *documentsDirectory = [paths objectAtIndex:0];
                
                NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:fileName];
                
                [fileManager removeItemAtPath: fullPath error:NULL];
                
                //					////nslog(@"image removed");
            }
            if([catchArray1 count]==0){}
            else {
                
				
                
				for (int image=0; image<[catchArray1 count]; image++)
                {
                    NSString *filename2;
                    filename2=[(NSDictionary *)[catchArray1 objectAtIndex:image]valueForKey:@"name"];
                    NSFileManager *fileManager = [NSFileManager defaultManager];
                    
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
                    
                    NSString *documentsDirectory = [paths objectAtIndex:0];
                    
                    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:filename2];
                    
                    [fileManager removeItemAtPath: fullPath error:NULL];
                    
                    //nslog(@"image removed");
                    
                }
            }
            
            
            
            [objdatabase DeleteData:@"AddClient" :@"Cid" :i];
            
            [objdatabase DeleteData:@"Formula_Detail" :@"CID" :i];
            
            [objdatabase DeleteData:@"Service_Detail" :@"CID" :i];
            [objdatabase DeleteData:@"Image" :@"CID" :i];
            
				
				
						
							
				
			
			
		
		
		}		
		index++;
	}
	
	for (id value in rowsToBeDeleted)
	{
		[countries removeObject:value];
	}
	
	[self.tblDire deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
	
	[indexPaths release];
	[rowsToBeDeleted release];
	inPseudoEditMode = NO;
	[self populateSelectedArray];
	[self.tblDire reloadData];
}
-(IBAction)togglePseudoEditMode
{
	self.inPseudoEditMode = !inPseudoEditMode;
	self.view.hidden = !inPseudoEditMode;
	
	[self.tblDire reloadData];
	
}
- (void)populateSelectedArray
{
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[countries count]];
	for (int i=0; i < [countries count]; i++)
		[array addObject:[NSNumber numberWithBool:NO]];
	self.selectedArray = array;
	[array release];
}
-(void)showdata{
    self.countries=[[NSMutableArray alloc]init];
	
    [objdatabase ShowDataForClientname:@""];
    [self.countries addObjectsFromArray:objdatabase.catchArray];
    
}
-(void)showimage{
	catchArray1=[[NSMutableArray alloc]init];
    [objdatabase ShowDataForImage:[NSString stringWithFormat:@"where CID=%d",clientid]];
    [catchArray1 addObjectsFromArray:objdatabase.catchArray];
    
    
    	
	
	
}

-(IBAction)cancel:(id)sender{
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

-(void)viewWillAppear:(BOOL)animated{

    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	
    objdatabase=[[DataBase alloc]init];
    
    
    
	[self showdata];
	self.inPseudoEditMode = YES;
    

	self.selectedImage = [UIImage imageNamed:@"selected.png"];
	self.unselectedImage = [UIImage imageNamed:@"unselected.png"];
    
	
	
	[self populateSelectedArray];

}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=TRUE;
	
	
	[btndelete setImage:[UIImage imageNamed:@"delete.png"]];
	
    
	//
//	
//	NSString *path = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"txt"];
//	NSString *countryData = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//	self.countries = [NSMutableArray arrayWithArray:[countryData componentsSeparatedByString:@"\n"]];
//	[countryData release];
//	
		
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [countries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
	static NSString *EditCellIdentifier = @"EditCell";
    
//    UIImageView *cellImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320, 45)];
//    [cellImg setImage:[UIImage imageNamed:@"cell.png"]];
//    
      
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EditCellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:EditCellIdentifier] autorelease];
		
		
		UILabel *label = [[UILabel alloc] initWithFrame:kLabelRect1];
		label.tag = kCellLabelTag;
        label.textColor=[UIColor blackColor];
        label.font=[UIFont fontWithName:@"Arial" size:14.0];
        
		[cell.contentView addSubview:label];
		[label release];
		
		UIImageView *imageView = [[UIImageView alloc] initWithImage:unselectedImage];
		imageView.frame = CGRectMake(5.0, 10.0, 20.0, 20.0);
		[cell.contentView addSubview:imageView];
		imageView.hidden = !inPseudoEditMode;
		imageView.tag = kCellImageViewTag;
		[imageView release];
		 
		 
      //  [cell.contentView addSubview:cellImg];  
        
        
        
	}
   // [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    
    
    
    
  //  cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell.png"]] autorelease];

	[UIView beginAnimations:@"cell shift" context:nil];
	
	UILabel *label = (UILabel *)[cell.contentView viewWithTag:kCellLabelTag];
    label.textColor=[UIColor blackColor];
    label.backgroundColor=[UIColor clearColor];
    
	label.text = [(NSDictionary *)[self.countries objectAtIndex:indexPath.row]valueForKey:@"name"];
	label.frame = (inPseudoEditMode) ? kLabelIndentedRect1 : kLabelRect1;
	label.opaque = NO;
    label.font=[UIFont fontWithName:@"Arial" size:14.0];
    label.font=[UIFont boldSystemFontOfSize:14];
    
    
    
	UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:kCellImageViewTag];
	NSNumber *selected = [selectedArray objectAtIndex:[indexPath row]];
	imageView.image = ([selected boolValue]) ? selectedImage : unselectedImage;
	imageView.hidden = !inPseudoEditMode;
	[UIView commitAnimations];
	
	
		
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	clientid=[[(NSDictionary *)[self.countries objectAtIndex:indexPath.row]valueForKey:@"id"]intValue];
	[self showimage];
	
		
	[self.tblDire deselectRowAtIndexPath:indexPath animated:YES];
	if (inPseudoEditMode)
	{
		BOOL selected = [[selectedArray objectAtIndex:[indexPath row]] boolValue];
		[selectedArray replaceObjectAtIndex:[indexPath row] withObject:[NSNumber numberWithBool:!selected]];
		[tableView reloadData];
	}
	
	
}
- (void)dealloc {
	
	//[catchArray release];
	[temp release];
	[catchArray1 release];
	[temp1 release];
	
	[countries release];
	[selectedArray release];
	//[deleteButton release];
	[super dealloc];
}


@end
