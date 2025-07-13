{
    if ($0 == "") {
        print "One for you, one for me."
    } else {
        print "One for " $0 ", one for me."
    }
}
END {
    if (!NR) print "One for you, one for me."
}
