{ pkgs }:

pkgs.writeScriptBin "dir-imgs" ''
    find $1 \
        -name "*.png" \ # Portable Network Graphics
        -name "*.jpg" \ # JPEG
        -name "*.gif" \ # Graphics Interchange Format
        -name "*.bmp" \ # Bitmap
        -name "*.tiff" \ # Tagged Image File Format
        -name "*.svg" \ # Scalable Vector Graphics
        -name "*.eps" \ # Encapsulated PostScript
        -name "*.pdf" \ # Portable Document Format
        -name "*.ico" \ # Icon
        -name "*.psd" \ # Adobe Photoshop Document
        -exec echo {} \; \ # print the file name
        -exec wezterm imgcat {} \; # display the image
''
