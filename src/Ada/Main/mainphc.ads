with Standard_Natural_Numbers;           use Standard_Natural_Numbers;

procedure mainphc ( nt : in natural32; infilename,outfilename : in string );

-- DESCRIPTION :
--   This is the main interactive driver for the homotopy continuation
--   package for the solution of polynomial system.

-- ON ENTRY :
--   nt             the number of tasks, if 0 then no multitasking,
--                  otherwise nt tasks will be used to track the paths;
--   infilename     the name of the input file;
--   outfilename    the name of the output file.
