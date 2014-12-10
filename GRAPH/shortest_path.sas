/* The undirected graph $G$ can be represented by the links data set LinkSetIn as follows:  */
data LinkSetIn;
   input from $ to $ weight @@;
   datalines;
A B 3  A C 2  A D 6  A E 4  B D 5
B F 5  C E 1  D E 2  D F 1  E F 4
;
/* The following statements calculate shortest paths for all source-sink pairs: */
proc optnet
   data_links     = LinkSetIn;
   shortpath
      out_weights = ShortPathW
      out_paths   = ShortPathP;
run;
/* The following statements display only the longest shortest paths: */
proc optnet
   data_links   = LinkSetIn;
   shortpath
      paths     = longest
      out_paths = ShortPathLong;
run;
