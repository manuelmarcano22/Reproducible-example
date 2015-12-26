add_cus_dep('pytxcode', 'tex', 0, 'pythontex');
sub pythontex {
# This subroutine is a fudge, because it from latexmk's point of
# view, it makes the main .tex file depend on the .pytxcode file.
# But it doesn't actually make the .tex file, but is used for its
# side effects in creating other files.  The dependence is a way
# of triggering the rule to be run whenever the .pytxcode file
# changes, and to do this before running latex/pdflatex again.
return system("pythontex2.py \"$_[0]\"") ;
}
