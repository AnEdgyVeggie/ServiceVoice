// REGEX CONSTANTS

// names
RegExp namesRegExp = RegExp(r'^[a-zA-Z]+$');

// email
RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.-_]+@[a-zA-Z0-9.-]+[.][a-zA-Z]+$');

// password checking
RegExp numRegExp = RegExp(r'[0-9]');
RegExp lowerExp = RegExp(r'[a-z]');
RegExp upperExp = RegExp(r'[A-Z]');
RegExp specialChar = RegExp(r'[!@#$\%^&*_=+\[\].,<>?:;|-]');