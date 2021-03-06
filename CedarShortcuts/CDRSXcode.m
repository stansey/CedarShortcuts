#import "CDRSXcode.h"

@implementation CDRSXcode
+ (NSMenu *)menuWithTitle:(NSString *)title {
    return [[[NSApp mainMenu] itemWithTitle:title] submenu];
}
@end

@interface CDRSXcode (WorkspaceClassDump)
- (id)editor;
- (id)editorArea;
- (id)lastActiveEditorContext;
@end

@implementation CDRSXcode (Workspace)

+ (XC(Workspace))currentWorkspace {
    return [(id)self.currentWorkspaceController valueForKey:@"_workspace"];
}

+ (XC(IDEWorkspaceWindowController))currentWorkspaceController {
    id workspaceController = [[NSApp keyWindow] windowController];
    if ([workspaceController isKindOfClass:NSClassFromString(@"IDEWorkspaceWindowController")]) {
        return workspaceController;
    } return nil;
}

+ (XC(IDESourceCodeEditor))currentSourceCodeEditor {
    id editorArea = [(id)self.currentWorkspaceController editorArea]; // IDEEditorArea
    id editorContext = [editorArea lastActiveEditorContext];          // IDEEditorContext
    return [editorContext editor];                                    // IDESourceCodeEditor
}

+ (NSURL *)currentSourceCodeDocumentFileURL {
    return CDRSXcode.currentSourceCodeEditor.sourceCodeDocument.fileURL;
}
@end
