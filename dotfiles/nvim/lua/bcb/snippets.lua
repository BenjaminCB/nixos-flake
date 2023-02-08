-- example of predetermined text that can be changed ["for"] = U.match_indentation "for (${1:int i = }; ${2:i }; ${3:i}) {\n\t$0\n}";
local U = require'snippets.utils'
require'snippets'.snippets = {
    _global = {
        test = "it worked";
        date = os.date("%y-%m-%d");
    };
    markdown = {
        ["smeeting"] = "# Intro\nThis is a summary of our ${1} supervisor meeting.\n\nDate of the meeting: ${2=os.date(\"%y-%m-%d\")} (actually document creation, but close enough).\n\n# Agenda\n${0}\n\n# Meeting notes";
    };
    c = {
        ["if"]      = U.match_indentation "if (${1}) {\n\t$0\n}";
        ["elif"]    = U.match_indentation "else if (${1}) {\n\t$0\n}";
        ["switch"]  = U.match_indentation "switch (${1}) {\n\tcase ${2}:\n\t\t$0\n\tdefault:\n}";
        ["while"]   = U.match_indentation "while (${1}) {\n\t$0\n}";
        ["dowhile"] = U.match_indentation "do {\n\t$0\n} while (${1});";
        ["for"]     = U.match_indentation "for (${1}) {\n\t$0\n}";
    };
    html = {
        ["html"] =                     "<!DOCTYPE html>\n<html>$0\n\t<head>\n\t\t<meta charset=\"UTF-8\">\n\t</head>\n\n\t<body>\n\t</body>\n</html>";
        ["css"]  = U.match_indentation "<link rel=\"stylesheet\" href=\"$0\">";
        ["js"]   = U.match_indentation "<script src=\"$0\"></script>";
        ["pa"]   = U.match_indentation "<p>\n\t$0\n</p>";
        ["an"]   = U.match_indentation "<a href=\"$0\"></a>";
        ["div"]  = U.match_indentation "<div>\n\t$0\n</div>";
        ["ul"]   = U.match_indentation "<ul>\n\t$0\n</ul>";
        ["ol"]   = U.match_indentation "<ol>\n\t$0\n</ol>";
        ["li"]   = U.match_indentation "<li>$0</li>";
        ["em"]   = U.match_indentation "<em>$0</em>";
        ["str"]  = U.match_indentation "<strong>$0</strong>";
    };
    tex = {
        ["beg"]  = U.match_indentation "\\begin{${1}}\n\t$0\n\\end{$1}";
        ["eq"]   = U.match_indentation "\\begin{equation}\n\t$0\n\\end{equation}";
        ["ali"]  = U.match_indentation "\\begin{align}\n\t$0\n\\end{align}";
        ["fig"]  = U.match_indentation "\\begin{figure}[h!]\n\t\\centering\n\t\\caption{${1}}\n\t\\includegraphics[width=\\textwidth]{${2}}\n\t\\label{fig:${3}}\n\\end{figure}$0";
        ["item"] = U.match_indentation "\\begin{itemize}\n\t\\item $0\n\\end{itemize}";
        ["enum"] = U.match_indentation "\\begin{enumerate}\n\t\\item $0\n\\end{enumerate}";
        ["plot"] = U.match_indentation "\\begin{figure}[h!]\n\t\\centering\n\t\\begin{tikzpicture}\n\t\t\\begin{axis}[\n\t\t\txmin=${1:-10}, xmax=${2:10}\n\t\t\tymin=${3:-10}, ymax=${4:10},\n\t\t\taxis lines = middle,\n\t\t]\n\t\t\t\\addplot[domain=$1:$2, samples=${5:100}]{${6};\n\t\t\\end{axis}\n\t\\end{tixzpicture}\n\t\\caption{${7}}\n\t\\label{fig:${8}}\n\\end{figure}$0";
        ["pac"]  =                     "\\usepackage{${1}}$0";
        ["//"]   = U.match_indentation "\\frac{${1}}{${2}} $0";
        ["1/"]   = U.match_indentation "\\frac{1}{${1}} $0";
        ["vec"]  = U.match_indentation "\\vec{${1}} $0";
        ["sqrt"] = U.match_indentation "\\sqrt[${1}]{${2}} $0";
        ["<="]   =                     "\\le ";
        [">="]   =                     "\\ge ";
        ["!="]   =                     "\\neq ";
        ["inf"]  =                     "\\infty ";
        ["and"]  =                     "\\wedge ";
        ["or"]   =                     "\\vee ";
        ["c="]   =                     "\\subsuteq ";
        ["nn"]   =                     "\\cap ";
        ["uu"]   =                     "\\cup ";
        ["**"]   =                     "\\cdot ";
        ["->"]   =                     "\\to ";
        ["<->"]  =                     "\\leftrightarrow ";
    };
}
