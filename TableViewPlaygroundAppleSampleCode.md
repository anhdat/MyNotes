Table View Playground Apple Sample Code

- ATDesktopEntity is an abstract class that wrap only a file URL
- ATDesktopFolderEntity is a concrete subclass of ATDesktopEntity that represent a folder with _children property.
- ATDesktopImageEntity is a concrete subclass of ATDesktopEntity that supports image loading with properties like: BOOL _imageLoading, _image, _thumbnailImage and stores a fillColor property.

#ATDesktopEntity.m

+ (ATDesktopEntity *)entityForURL:(NSURL *)url {
    // We create folder items or image items, and ignore everything else; all based on the UTI we get from the URL
    NSString *typeIdentifier;
    if ([url getResourceValue:&typeIdentifier forKey:NSURLTypeIdentifierKey error:NULL]) {
        NSArray *imageUTIs = [NSImage imageTypes]; // ah, that's how they grag UTI of images
        if ([imageUTIs containsObject:typeIdentifier]) {
            return [[[ATDesktopImageEntity alloc] initWithFileURL:url] autorelease];
        } else if ([typeIdentifier isEqualToString:(NSString *)kUTTypeFolder]) { // simple checking for folder type
            return [[[ATDesktopFolderEntity alloc] initWithFileURL:url] autorelease];;
        } 
    }
    return nil;
}

// They use static lastColorIndex, interestingly
@implementation ATDesktopImageEntity

- (id)initWithFileURL:(NSURL *)fileURL {
    self = [super initWithFileURL:fileURL];
    // Initialize our color to specific given color for testing purposes
    static NSInteger lastColorIndex = 0;
    NSColorList *colorList = [NSColorList colorListNamed:@"Crayons"];
    NSArray *keys = [colorList allKeys];
    if (lastColorIndex >= keys.count) {
        lastColorIndex = 0;
    }
    _fillColorName = [[keys objectAtIndex:lastColorIndex++] retain];
    _fillColor = [[colorList colorWithKey:_fillColorName] retain];
    self.title = [super title];
    return self;
}
