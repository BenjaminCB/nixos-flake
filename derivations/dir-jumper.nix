{ pkgs }:

pkgs.writers.writePython3Bin "dj" {} ''
    import os


    def current_path():
        print("Current working directory before")
        print(os.getcwd())
        print()


    current_path()
    os.chdir('../')
    current_path()
''

# pkgs.writeShellApplication {
    # name = "dj";
    # runtimeInputs = with pkgs; [ coreutils fzf ];
    # text = ''
        # touch ~/.dir-jumper

        # dir=$(pwd)
        # echo "$dir" >> ~/.dir-jumper

        # cdto=$(fzf < ~/.dir-jumper)
        # cd "$cdto"
    # '';
# }
