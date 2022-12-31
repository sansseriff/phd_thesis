for dir in src/chapter_0*; 
    do
    CHAPNAME=$(echo $dir | cut -d '/' -f 2)
    cp -v $dir/figs/*.svg mkdocs/docs/$CHAPNAME/
    done