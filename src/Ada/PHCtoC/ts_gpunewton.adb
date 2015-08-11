with text_io;                            use text_io;
with Communications_with_User;           use Communications_with_User;
with Standard_Natural_Numbers;           use Standard_Natural_Numbers;
with Standard_Natural_Numbers_io;        use Standard_Natural_Numbers_io;
with Standard_Integer_Numbers;           use Standard_Integer_Numbers;
with Standard_Complex_Poly_Systems;
with Standard_Complex_Solutions;
with Standard_Complex_Solutions_io;      use Standard_Complex_Solutions_io;
with Standard_System_and_Solutions_io;
with Standard_PolySys_Container;
with Standard_Solutions_Container;

procedure ts_gpunewton is

-- DESCRIPTION :
--   Procedure to test the development of the acceleration of Newton's method
--   as called from an Ada procedure.  The Ada procedure remains in control.
--   Data is passed to the C++ code via the systems and solutions containers.

  procedure Standard_GPU_Newton ( execmode,verbose : integer32 ) is

  -- DESCRIPTION :
  --   Calls the accelerated Newton's method in standard double precision.
  --   The first input parameter is the mode of execution: 0, 1, or 2.
  --   If verbose > 0, then additional output is written to screen.

    return_of_call : integer32;

    function newton ( m,v : integer32 ) return integer32;
    pragma import(C, newton, "gpunewton_d");

  begin
    return_of_call := newton(execmode,verbose);
  end Standard_GPU_Newton;

  function Prompt_for_Mode return integer32 is

  -- DESCRIPTION :
  --   Shows the user the menu and prompts for a mode of execution,
  --   returned as 0, 1, or 2.

    ans : character;

  begin
    new_line;
    put_line("MENU for the mode of execution : ");
    put_line("  0. Both the CPU and GPU will execute Newton's method.");
    put_line("  1. Only the CPU will execute Newton's method.");
    put_line("  2. Only the GPU will execute Newton's method.");
    put("Type 0, 1, or 2 : ");
    Ask_Alternative(ans,"012");
    case ans is
      when '0' => return 0;
      when '1' => return 1;
      when '2' => return 2;
      when others => return -1;
    end case;
  end Prompt_for_Mode;

  function Prompt_for_Verbose return integer32 is

  -- DESCRIPTION :
  --   Asks the user if extra output is wanted and returns 0 or 1.

    ans : character;

  begin
    new_line;
    put("Extra output before and after the computations ? (y/n) ");
    Ask_Yes_or_No(ans);
    if ans = 'y'
     then return 1;
     else return 0;
    end if;
  end Prompt_for_Verbose;

  procedure Standard_Newton is

  -- DESCRIPTION :
  --   Reads a polynomial system and a corresponding list of solutions
  --   in standard double precision.

    use Standard_Complex_Poly_Systems;
    use Standard_Complex_Solutions;

    p : Link_to_Poly_Sys;
    sols,newtsols : Solution_List;
    execmode,verbose : integer32;

  begin
    new_line;
    put_line("Reading a system with solutions ...");
    Standard_System_and_Solutions_io.get(p,sols);
    new_line;
    put("Read "); put(Length_Of(sols),1); put_line(" solutions.");
    put_line("Initializing the systems container ...");
    Standard_PolySys_Container.Initialize(p.all);
    put_line("Initializing the solutions container ...");
    Standard_Solutions_Container.Initialize(sols);
    execmode := Prompt_for_Mode;
    verbose := Prompt_for_Verbose;
    Standard_GPU_Newton(execmode,verbose);
    newtsols := Standard_Solutions_Container.Retrieve;
    put_line("The solutions after Newton's method :");
    put(standard_output,Length_Of(newtsols),
        natural32(Head_Of(newtsols).n),newtsols);
  end Standard_Newton;

  procedure Main is
  begin
    Standard_Newton;
  end Main;

begin
  Main;
end ts_gpunewton;
