#include <AppKit/AppKit.h>

void clearMainMenu ()
{
  if ([NSApp mainMenu] != NULL) {
    [[NSApp mainMenu] release];
    [NSApp setMainMenu:NULL];
  }
}

void clearWindowsMenu ()
{
  if ([NSApp windowsMenu] != NULL) {
    [[NSApp windowsMenu] release];
    [NSApp setWindowsMenu:NULL];
  }
}

void sharedApplication ()
{
  [NSApplication sharedApplication];
}
