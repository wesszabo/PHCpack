with text_io;                           use text_io;
with Communications_with_User;          use Communications_with_User;
with Standard_Natural_Numbers;          use Standard_Natural_Numbers;
with Standard_Natural_Numbers_io;       use Standard_Natural_Numbers_io;
with Standard_Integer_Numbers;          use Standard_Integer_Numbers;
with Standard_Integer_Numbers_io;       use Standard_Integer_Numbers_io;
with Standard_Floating_Numbers;         use Standard_Floating_Numbers;
with Standard_Floating_Numbers_io;      use Standard_Floating_Numbers_io;
with Double_Double_Numbers;             use Double_Double_Numbers;
with Double_Double_Numbers_io;          use Double_Double_Numbers_io;
with Quad_Double_Numbers;               use Quad_Double_Numbers;
with Quad_Double_Numbers_io;            use Quad_Double_Numbers_io;
with Standard_Complex_Numbers;
with Standard_Complex_Numbers_io;       use Standard_Complex_Numbers_io;
with DoblDobl_Complex_Numbers;
with DoblDobl_Complex_Numbers_io;       use DoblDobl_Complex_Numbers_io;
with QuadDobl_Complex_Numbers;
with QuadDobl_Complex_Numbers_io;       use QuadDobl_Complex_Numbers_io;
with Standard_Complex_Vectors_io;
with DoblDobl_Complex_Vectors_io;
with QuadDobl_Complex_Vectors_io;
with Standard_Complex_Series;
with Standard_Complex_Series_io;        use Standard_Complex_Series_io;
with DoblDobl_Complex_Series;
with DoblDobl_Complex_Series_io;        use DoblDobl_Complex_Series_io;
with QuadDobl_Complex_Series;
with QuadDobl_Complex_Series_io;        use QuadDobl_Complex_Series_io;
with Standard_Complex_Random_Series;
with DoblDobl_Complex_Random_Series;
with QuadDobl_Complex_Random_Series;
with Standard_Complex_Algebraic_Series;
with DoblDobl_Complex_Algebraic_Series;
with QuadDobl_Complex_Algebraic_Series;
with Standard_Complex_Series_Norms;
with Standard_Complex_Series_Functions;
with DoblDobl_Complex_Series_Norms;
with DoblDobl_Complex_Series_Functions;
with QuadDobl_Complex_Series_Norms;
with QuadDobl_Complex_Series_Functions;

procedure ts_cseries is

  procedure Standard_Construct is

  -- DESCRIPTION :
  --   Basic test on the construction of a series
  --   in standard double precision.

    i : integer := 123;
    first : constant Standard_Complex_Series.Series
          := Standard_Complex_Series.Create(i);
    second : Standard_Complex_Series.Series(4);
    third : Standard_Complex_Series.Series(4);

  begin
    text_io.put_line("The first series, the constant 123 : ");
    Standard_Complex_Vectors_io.put_line(first.cff);
    text_io.put_line("The second series : ");
    second.cff(0) := Standard_Complex_Numbers.Create(integer32(1));
    second.cff(1) := Standard_Complex_Numbers.Create(integer32(-1));
    second.cff(2) := Standard_Complex_Numbers.Create(integer32(0));
    second.cff(3) := Standard_Complex_Numbers.Create(integer32(0));
    second.cff(4) := Standard_Complex_Numbers.Create(integer32(0));
    Standard_Complex_Vectors_io.put_line(second.cff);
    third := Standard_Complex_Series.Inverse(second);
    text_io.put_line("The inverse of the second series : ");
    Standard_Complex_Vectors_io.put_line(third.cff);
  end Standard_Construct;

  procedure DoblDobl_Construct is

  -- DESCRIPTION :
  --   Basic test on the construction of a series
  --   in double double precision.

    i : integer := 123;
    first : constant DoblDobl_Complex_Series.Series
          := DoblDobl_Complex_Series.Create(i);
    second : DoblDobl_Complex_Series.Series(4);
    third : DoblDobl_Complex_Series.Series(4);

  begin
    text_io.put_line("The first series, the constant 123 : ");
    DoblDobl_Complex_Vectors_io.put_line(first.cff);
    text_io.put_line("The second series : ");
    second.cff(0) := DoblDobl_Complex_Numbers.Create(integer32(1));
    second.cff(1) := DoblDobl_Complex_Numbers.Create(integer32(-1));
    second.cff(2) := DoblDobl_Complex_Numbers.Create(integer32(0));
    second.cff(3) := DoblDobl_Complex_Numbers.Create(integer32(0));
    second.cff(4) := DoblDobl_Complex_Numbers.Create(integer32(0));
    DoblDobl_Complex_Vectors_io.put_line(second.cff);
    third := DoblDobl_Complex_Series.Inverse(second);
    text_io.put_line("The inverse of the second series : ");
    DoblDobl_Complex_Vectors_io.put_line(third.cff);
  end DoblDobl_Construct;

  procedure QuadDobl_Construct is

  -- DESCRIPTION :
  --   Basic test on the construction of a series
  --   in quad double precision.

    i : integer := 123;
    first : constant QuadDobl_Complex_Series.Series
          := QuadDobl_Complex_Series.Create(i);
    second : QuadDobl_Complex_Series.Series(4);
    third : QuadDobl_Complex_Series.Series(4);

  begin
    text_io.put_line("The first series, the constant 123 : ");
    QuadDobl_Complex_Vectors_io.put_line(first.cff);
    text_io.put_line("The second series : ");
    second.cff(0) := QuadDobl_Complex_Numbers.Create(integer32(1));
    second.cff(1) := QuadDobl_Complex_Numbers.Create(integer32(-1));
    second.cff(2) := QuadDobl_Complex_Numbers.Create(integer32(0));
    second.cff(3) := QuadDobl_Complex_Numbers.Create(integer32(0));
    second.cff(4) := QuadDobl_Complex_Numbers.Create(integer32(0));
    QuadDobl_Complex_Vectors_io.put_line(second.cff);
    third := QuadDobl_Complex_Series.Inverse(second);
    text_io.put_line("The inverse of the second series : ");
    QuadDobl_Complex_Vectors_io.put_line(third.cff);
  end QuadDobl_Construct;

  procedure Standard_Test_Creation ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Verifies that 1/(1-t) = 1 + t + t^2 + ...
  --   for a truncated power series with coefficients
  --   in standard double precision on variable degree series.

    use Standard_Complex_Numbers;
    use Standard_Complex_Series;

    s : Link_to_Series := Create(1,degree);
    t,x,y,z : Link_to_Series;

  begin
    put("One as series of degree "); put(degree,1); put_line(" :");
    put(s);
    t := Create(1,degree);
    t.cff(1) := Create(-1.0);
    put_line("The series 1 - t :"); put(t); 
    x := s/t;
    put_line("The series 1/(1-t) : "); put(x);
    y := x*t;
    put_line("Verifying multiplication with inverse : "); put(y);
    z := t*x;
    put_line("Verifying commutativity : "); put(z);
  end Standard_Test_Creation;

  procedure DoblDobl_Test_Creation ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Verifies that 1/(1-t) = 1 + t + t^2 + ...
  --   for a truncated power series with coefficients
  --   in double double precision on variable degree series.

    use DoblDobl_Complex_Numbers;
    use DoblDobl_Complex_Series;

    s : Link_to_Series := Create(1,degree);
    t,x,y,z : Link_to_Series;
    minone : constant double_double := create(-1.0);

  begin
    put("One as series of degree "); put(degree,1); put_line(" :");
    put(s);
    t := Create(1,degree);
    t.cff(1) := Create(minone);
    put_line("The series 1 - t :"); put(t); 
    x := s/t;
    put_line("The series 1/(1-t) : "); put(x);
    y := x*t;
    put_line("Verifying multiplication with inverse : "); put(y);
    z := t*x;
    put_line("Verifying commutativity : "); put(z);
  end DoblDobl_Test_Creation;

  procedure QuadDobl_Test_Creation ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Verifies that 1/(1-t) = 1 + t + t^2 + ...
  --   for a truncated power series with coefficients
  --   in quad double precision on variable degree series.

    use QuadDobl_Complex_Numbers;
    use QuadDobl_Complex_Series;

    s : Link_to_Series := Create(1,degree);
    t,x,y,z : Link_to_Series;
    minone : constant quad_double := create(-1.0);

  begin
    put("One as series of degree "); put(degree,1); put_line(" :");
    put(s);
    t := Create(1,degree);
    t.cff(1) := Create(minone);
    put_line("The series 1 - t :"); put(t); 
    x := s/t;
    put_line("The series 1/(1-t) : "); put(x);
    y := x*t;
    put_line("Verifying multiplication with inverse : "); put(y);
    z := t*x;
    put_line("Verifying commutativity : "); put(z);
  end QuadDobl_Test_Creation;

  procedure Standard_Test_Arithmetic ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Does a basic test on the arithmetic in standard double precision,
  --   on random series of the given degree.

    use Standard_Complex_Series;

    a,b,c : Series(degree);
    ans : character;

  begin
    a := Standard_Complex_Random_Series.Random_Series(degree);
    put_line("The first random series A :"); put(a);
    b := Standard_Complex_Random_Series.Random_Series(degree);
    put_line("The second random series B :"); put(b);
    c := a+b;
    put_line("The sum A + B :"); put(c);
    c := c-a;
    put_line("The sum A + B - A :"); put(c); 
    new_line;
    put("Continue ? (y/n) "); Ask_Yes_or_No(ans);
    if ans = 'y' then
      c := a*b;
      put_line("The product A*B :"); put(c);
      c := c/a;
      put_line("The product A*B/A :"); put(c);
    end if;
  end Standard_Test_Arithmetic;

  procedure DoblDobl_Test_Arithmetic ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Does a basic test on the arithmetic in double double precision,
  --   on random series of the given degree.

    use DoblDobl_Complex_Series;

    a,b,c : Series(degree);
    ans : character;

  begin
    a := DoblDobl_Complex_Random_Series.Random_Series(degree);
    put_line("The first random series A :"); put(a);
    b := DoblDobl_Complex_Random_Series.Random_Series(degree);
    put_line("The second random series B :"); put(b);
    c := a+b;
    put_line("The sum A + B :"); put(c);
    c := c-a;
    put_line("The sum A + B - A :"); put(c); 
    new_line;
    put("Continue ? (y/n) "); Ask_Yes_or_No(ans);
    if ans = 'y' then
      c := a*b;
      put_line("The product A*B :"); put(c);
      c := c/a;
      put_line("The product A*B/A :"); put(c);
    end if;
  end DoblDobl_Test_Arithmetic;

  procedure QuadDobl_Test_Arithmetic ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Does a basic test on the arithmetic in quad double precision,
  --   on random series of the given degree.

    use QuadDobl_Complex_Series;

    a,b,c : Series(degree);
    ans : character;

  begin
    a := QuadDobl_Complex_Random_Series.Random_Series(degree);
    put_line("The first random series A :"); put(a);
    b := QuadDobl_Complex_Random_Series.Random_Series(degree);
    put_line("The second random series B :"); put(b);
    c := a+b;
    put_line("The sum A + B :"); put(c);
    c := c-a;
    put_line("The sum A + B - A :"); put(c); 
    new_line;
    put("Continue ? (y/n) "); Ask_Yes_or_No(ans);
    if ans = 'y' then
      c := a*b;
      put_line("The product A*B :"); put(c);
      c := c/a;
      put_line("The product A*B/A :"); put(c);
    end if;
  end QuadDobl_Test_Arithmetic;

  procedure Standard_Random_Test_sqrt ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and tests the square root computation,
  --   in standard double precision.

    use Standard_Complex_Series;

    c : constant Series(degree)
      := Standard_Complex_Random_Series.Random_Series(degree);
    ans : character;
    x,y,z : Series(degree);
 
  begin
    put("Extra output during the computation ? (y/n) ");
    Ask_Yes_or_No(ans);
    new_line;
    put("A random series c of degree "); put(degree,1); put_line(" :");
    put(c);
    if ans = 'y'
     then x := Standard_Complex_Algebraic_Series.sqrt(c,0,true);
     else x := Standard_Complex_Algebraic_Series.sqrt(c,0);
    end if;
    put_line("The square root x of the random series :"); put(x);
    y := x*x;
    put_line("The square y of the square root x : "); put(y);
    z := y-c;
    put_line("The equation x*x - c :"); put(z);
  end Standard_Random_Test_sqrt;

  procedure DoblDobl_Random_Test_sqrt ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and tests the square root computation,
  --   in double double precision.

    use DoblDobl_Complex_Series;

    c : constant Series(degree)
      := DoblDobl_Complex_Random_Series.Random_Series(degree);
    ans : character;
    x,y,z : Series(degree);
 
  begin
    put("Extra output during the computation ? (y/n) ");
    Ask_Yes_or_No(ans);
    new_line;
    put("A random series c of degree "); put(degree,1); put_line(" :");
    put(c);
    if ans = 'y'
     then x := DoblDobl_Complex_Algebraic_Series.sqrt(c,0,true);
     else x := DoblDobl_Complex_Algebraic_Series.sqrt(c,0);
    end if;
    put_line("The square root x of the random series :"); put(x);
    y := x*x;
    put_line("The square y of the square root x : "); put(y);
    z := y-c;
    put_line("The equation x*x - c :"); put(z);
  end DoblDobl_Random_Test_sqrt;

  procedure QuadDobl_Random_Test_sqrt ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and tests the square root computation,
  --   in quad double precision.

    use QuadDobl_Complex_Series;

    c : constant Series(degree)
      := QuadDobl_Complex_Random_Series.Random_Series(degree);
    ans : character;
    x,y,z : Series(degree);
 
  begin
    put("Extra output during the computation ? (y/n) ");
    Ask_Yes_or_No(ans);
    new_line;
    put("A random series c of degree "); put(degree,1); put_line(" :");
    put(c);
    if ans = 'y'
     then x := QuadDobl_Complex_Algebraic_Series.sqrt(c,0,true);
     else x := QuadDobl_Complex_Algebraic_Series.sqrt(c,0);
    end if;
    put_line("The square root x of the random series :"); put(x);
    y := x*x;
    put_line("The square y of the square root x : "); put(y);
    z := y-c;
    put_line("The equation x*x - c :"); put(z);
  end QuadDobl_Random_Test_sqrt;

  procedure Standard_Random_Test_root ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and tests the square root computation,
  --   in standard double precision.

    use Standard_Complex_Series;

    c : constant Series(degree)
      := Standard_Complex_Random_Series.Random_Series(degree);
    n,i : natural32 := 0;
    ans : character;
    x,y,z : Series(degree);
 
  begin
    put("Give the power n in x**n - c : "); get(n);
    put("Give the index i of the root : "); get(i);
    new_line;
    put("Extra output during the computation ? (y/n) ");
    Ask_Yes_or_No(ans);
    new_line;
    put("A random series c of degree "); put(degree,1); put_line(" :");
    put(c);
    if ans = 'y'
     then x := Standard_Complex_Algebraic_Series.Root(c,n,i,true);
     else x := Standard_Complex_Algebraic_Series.Root(c,n,i);
    end if;
    put("The root x of index "); put(i,1);
    put_line(" of the random series :"); put(x);
    y := x**integer(n);
    put_line("The n-th power y of the root x : "); put(y);
    z := y-c;
    put_line("The equation x**n - c :"); put(z);
  end Standard_Random_Test_root;

  procedure DoblDobl_Random_Test_root ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and tests the square root computation,
  --   in double double precision.

    use DoblDobl_Complex_Series;

    c : constant Series(degree)
      := DoblDobl_Complex_Random_Series.Random_Series(degree);
    n,i : natural32 := 0;
    ans : character;
    x,y,z : Series(degree);
 
  begin
    put("Give the power n in x**n - c : "); get(n);
    put("Give the index i of the root : "); get(i);
    new_line;
    put("Extra output during the computation ? (y/n) ");
    Ask_Yes_or_No(ans);
    new_line;
    put("A random series c of degree "); put(degree,1); put_line(" :");
    put(c);
    if ans = 'y'
     then x := DoblDobl_Complex_Algebraic_Series.Root(c,n,i,true);
     else x := DoblDobl_Complex_Algebraic_Series.Root(c,n,i);
    end if;
    put("The root x of index "); put(i,1);
    put_line(" of the random series :"); put(x);
    y := x**integer(n);
    put_line("The n-th power y of the root x : "); put(y);
    z := y-c;
    put_line("The equation x**n - c :"); put(z);
  end DoblDobl_Random_Test_root;

  procedure QuadDobl_Random_Test_root ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and tests the square root computation,
  --   in quad double precision.

    use QuadDobl_Complex_Series;

    c : constant Series(degree)
      := QuadDobl_Complex_Random_Series.Random_Series(degree);
    n,i : natural32 := 0;
    ans : character;
    x,y,z : Series(degree);
 
  begin
    put("Give the power n in x**n - c : "); get(n);
    put("Give the index i of the root : "); get(i);
    new_line;
    put("Extra output during the computation ? (y/n) ");
    Ask_Yes_or_No(ans);
    new_line;
    put("A random series c of degree "); put(degree,1); put_line(" :");
    put(c);
    if ans = 'y'
     then x := QuadDobl_Complex_Algebraic_Series.Root(c,n,i,true);
     else x := QuadDobl_Complex_Algebraic_Series.Root(c,n,i);
    end if;
    put("The root x of index "); put(i,1);
    put_line(" of the random series :"); put(x);
    y := x**integer(n);
    put_line("The n-th power y of the root x : "); put(y);
    z := y-c;
    put_line("The equation x**n - c :"); put(z);
  end QuadDobl_Random_Test_root;

  procedure Standard_Test_Conjugate ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and makes the product with its conjugate,
  --   in standard double precision.

    use Standard_Complex_Series;
    use Standard_Complex_Series_Norms;

    s : constant Series(degree)
      := Standard_Complex_Random_Series.Random_Series(degree);
    c : constant Series(degree) := Conjugate(s);
    p,r,n,q,rq : Series(degree);

  begin
    put("A random series of degree "); put(degree,1); put_line(" :");
    put(s);
    put_line("Its conjugate : "); put(c);
    put_line("Conjugate(s)*s : "); put(c*s);
    put_line("s*Conjugate(s) : "); put(s*c);
    p := c*s;
    r := Standard_Complex_Algebraic_Series.sqrt(p,0);
    put_line("The square root r of Conjugate(s)*s :"); put(r);
    n := s/r;
    put_line("The normalized series s is s/r :"); put(n);
    q := Conjugate(n)*n;
    rq := Standard_Complex_Algebraic_Series.sqrt(q,0);
    put_line("The norm of the normalized series :"); put(rq);
  end Standard_Test_Conjugate;

  procedure DoblDobl_Test_Conjugate ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and makes the product with its conjugate,
  --   in double double precision.

    use DoblDobl_Complex_Series;
    use DoblDobl_Complex_Series_Norms;

    s : constant Series(degree)
      := DoblDobl_Complex_Random_Series.Random_Series(degree);
    c : constant Series(degree) := Conjugate(s);
    p,r,n,q,rq : Series(degree);

  begin
    put("A random series of degree "); put(degree,1); put_line(" :");
    put(s);
    put_line("Its conjugate : "); put(c);
    put_line("Conjugate(s)*s : "); put(c*s);
    put_line("s*Conjugate(s) : "); put(s*c);
    p := c*s;
    r := DoblDobl_Complex_Algebraic_Series.sqrt(p,0);
    put_line("The square root r of Conjugate(s)*s :"); put(r);
    n := s/r;
    put_line("The normalized series s is s/r :"); put(n);
    q := Conjugate(n)*n;
    rq := DoblDobl_Complex_Algebraic_Series.sqrt(q,0);
    put_line("The norm of the normalized series :"); put(rq);
  end DoblDobl_Test_Conjugate;

  procedure QuadDobl_Test_Conjugate ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and makes the product with its conjugate,
  --   in quad double precision.

    use QuadDobl_Complex_Series;
    use QuadDobl_Complex_Series_Norms;

    s : constant Series(degree)
      := QuadDobl_Complex_Random_Series.Random_Series(degree);
    c : constant Series(degree) := Conjugate(s);
    p,r,n,q,rq : Series(degree);

  begin
    put("A random series of degree "); put(degree,1); put_line(" :");
    put(s);
    put_line("Its conjugate : "); put(c);
    put_line("Conjugate(s)*s : "); put(c*s);
    put_line("s*Conjugate(s) : "); put(s*c);
    p := c*s;
    r := QuadDobl_Complex_Algebraic_Series.sqrt(p,0);
    put_line("The square root r of Conjugate(s)*s :"); put(r);
    n := s/r;
    put_line("The normalized series s is s/r :"); put(n);
    q := Conjugate(n)*n;
    rq := QuadDobl_Complex_Algebraic_Series.sqrt(q,0);
    put_line("The norm of the normalized series :"); put(rq);
  end QuadDobl_Test_Conjugate;


  procedure Standard_Test_Norm ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and computes its norm, in standard double precision.

    use Standard_Complex_Series;
    use Standard_Complex_Series_Norms;

    s : constant Series(degree)
      := Standard_Complex_Random_Series.Random_Series(degree);
    nrm : constant Series(degree) := Norm(s);
    ns : constant Series(degree) := Normalize(s);
    nrm2 : constant Series(degree) := Norm(ns);
  
  begin
    put("A random series of degree "); put(degree,1); put_line(" :");
    put(s);
    put_line("Its norm :"); put(nrm);
    put("The max-norm of the series : ");
    put(Max_Norm(s),3); new_line;
    put("The two-norm of the series : ");
    put(Two_Norm(s),3); new_line;
    put_line("The normalized series :"); put(ns);
    put_line("The norm of the normalized series :"); put(nrm2);
    put("The max-norm of the normalized series : ");
    put(Max_Norm(ns),3); new_line;
    put("The two-norm of the normalized series : ");
    put(Two_Norm(ns),3); new_line;
  end Standard_Test_Norm;

  procedure DoblDobl_Test_Norm ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and computes its norm, in double double precision.

    use DoblDobl_Complex_Series;
    use DoblDobl_Complex_Series_Norms;

    s : constant Series(degree)
      := DoblDobl_Complex_Random_Series.Random_Series(degree);
    nrm : constant Series(degree) := Norm(s);
    ns : constant Series(degree) := Normalize(s);
    nrm2 : constant Series(degree) := Norm(ns);
  
  begin
    put("A random series of degree "); put(degree,1); put_line(" :");
    put(s);
    put_line("Its norm :"); put(nrm);
    put("The max-norm of the series : ");
    put(Max_Norm(s),3); new_line;
    put("The two-norm of the series : ");
    put(Two_Norm(s),3); new_line;
    put_line("The normalized series :"); put(ns);
    put_line("The norm of the normalized series :"); put(nrm2);
    put("The max-norm of the normalized series : ");
    put(Max_Norm(ns),3); new_line;
    put("The two-norm of the normalized series : ");
    put(Two_Norm(ns),3); new_line;
  end DoblDobl_Test_Norm;

  procedure QuadDobl_Test_Norm ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Generates a random series of the given degree
  --   and computes its norm, in quad double precision.

    use QuadDobl_Complex_Series;
    use QuadDobl_Complex_Series_Norms;

    s : constant Series(degree)
      := QuadDobl_Complex_Random_Series.Random_Series(degree);
    nrm : constant Series(degree) := Norm(s);
    ns : constant Series(degree) := Normalize(s);
    nrm2 : constant Series(degree) := Norm(ns);
  
  begin
    put("A random series of degree "); put(degree,1); put_line(" :");
    put(s);
    put_line("Its norm :"); put(nrm);
    put("The max-norm of the series : ");
    put(Max_Norm(s),3); new_line;
    put("The two-norm of the series : ");
    put(Two_Norm(s),3); new_line;
    put_line("The normalized series :"); put(ns);
    put_line("The norm of the normalized series :"); put(nrm2);
    put("The max-norm of the normalized series : ");
    put(Max_Norm(ns),3); new_line;
    put("The two-norm of the normalized series : ");
    put(Two_Norm(ns),3); new_line;
  end QuadDobl_Test_Norm;

  procedure Standard_Test_Shift ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Does a basic test on shifting the series parameter
  --   on random series of the given degree,
  --   in standard double precision.

    use Standard_Complex_Numbers;
    use Standard_Complex_Series;
    use Standard_Complex_Series_Functions;

    s : constant Series(degree)
      := Standard_Complex_Random_Series.Random_Series(degree);
    rc : double_float := 0.0;
    shifteds : Series(degree);
    cc,y,z : Complex_Number;

  begin
    put_line("Shifting the series parameter ...");
    put_line("on a random series s :"); put(s);
    put("Give a real constant for the shift : "); get(rc);
    shifteds := Shift(s,rc);
    y := Eval(s,rc);
    z := Eval(shifteds,0.0);
    put("s(shift constant) : "); put(y); new_line;
    put("shifted series(0) : "); put(z); new_line;
    new_line;
    put_line("Testing with a complex shift ...");
    put("Give a complex number for the shift : "); get(cc);
    shifteds := Shift(s,cc);
    y := Eval(s,cc);
    z := Eval(shifteds,0.0);
    put("s(shift constant) : "); put(y); new_line;
    put("shifted series(0) : "); put(z); new_line;
  end Standard_Test_Shift;

  procedure DoblDobl_Test_Shift ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Does a basic test on shifting the series parameter
  --   on random series of the given degree,
  --   in double double precision.

    use DoblDobl_Complex_Numbers;
    use DoblDobl_Complex_Series;
    use DoblDobl_Complex_Series_Functions;

    s : constant Series(degree)
      := DoblDobl_Complex_Random_Series.Random_Series(degree);
    zero : constant double_double := create(0.0);
    rc : double_double := zero;
    shifteds : Series(degree);
    cc,y,z : Complex_Number;

  begin
    put_line("Shifting the series parameter ...");
    put_line("on a random series s :"); put(s);
    put("Give a real constant for the shift : "); get(rc);
    shifteds := Shift(s,rc);
    y := Eval(s,rc);
    z := Eval(shifteds,zero);
    put("s(shift constant) : "); put(y); new_line;
    put("shifted series(0) : "); put(z); new_line;
    new_line;
    put_line("Testing with a complex shift ...");
    put("Give a complex number for the shift : "); get(cc);
    shifteds := Shift(s,cc);
    y := Eval(s,cc);
    z := Eval(shifteds,zero);
    put("s(shift constant) : "); put(y); new_line;
    put("shifted series(0) : "); put(z); new_line;
  end DoblDobl_Test_Shift;

  procedure QuadDobl_Test_Shift ( degree : in integer32 ) is

  -- DESCRIPTION :
  --   Does a basic test on shifting the series parameter
  --   on random series of the given degree,
  --   in quad double precision.

    use QuadDobl_Complex_Numbers;
    use QuadDobl_Complex_Series;
    use QuadDobl_Complex_Series_Functions;

    s : constant Series(degree)
      := QuadDobl_Complex_Random_Series.Random_Series(degree);
    zero : constant quad_double := create(0.0);
    rc : quad_double := zero;
    shifteds : Series(degree);
    cc,y,z : Complex_Number;

  begin
    put_line("Shifting the series parameter ...");
    put_line("on a random series s :"); put(s);
    put("Give a real constant for the shift : "); get(rc);
    shifteds := Shift(s,rc);
    y := Eval(s,rc);
    z := Eval(shifteds,zero);
    put("s(shift constant) : "); put(y); new_line;
    put("shifted series(0) : "); put(z); new_line;
    new_line;
    put_line("Testing with a complex shift ...");
    put("Give a complex number for the shift : "); get(cc);
    shifteds := Shift(s,cc);
    y := Eval(s,cc);
    z := Eval(shifteds,zero);
    put("s(shift constant) : "); put(y); new_line;
    put("shifted series(0) : "); put(z); new_line;
  end QuadDobl_Test_Shift;

  procedure Main is

  -- DESCRIPTION :
  --   Prompts the user for the precision and runs tests.

    ans,prc : character;
    degree : integer32 := 0;

  begin
    new_line;
    put_line("MENU with testing operations :");
    put_line("  0. test the basic construct methods");
    put_line("  1. test the computation of 1/(1-t) for any degree");
    put_line("  2. test arithmetic");
    put_line("  3. square root of a random series");
    put_line("  4. p-th root of a random series");
    put_line("  5. test complex conjugate of a series");
    put_line("  6. test the norm of a series");
    put_line("  7. test shift of series parameter");
    put("Type 0, 1, 2, 3, 4, 5, 6, or 7 to select a test : ");
    Ask_Alternative(ans,"01234567");
    if ans /= '0' then
      new_line;
      put("Give the degree of the series : "); get(degree);
    end if;
    new_line;
    put_line("MENU for the precision :");
    put_line("  0. standard double precision");
    put_line("  1. double double precision");
    put_line("  2. quad double precision");
    put("Type 0, 1, or 2 to select the precision : ");
    Ask_Alternative(prc,"012");
    new_line;
    case prc is
      when '0' => 
        case ans is 
          when '0' => Standard_Construct;
          when '1' => Standard_Test_Creation(degree);
          when '2' => Standard_Test_Arithmetic(degree);
          when '3' => Standard_Random_Test_sqrt(degree);
          when '4' => Standard_Random_Test_root(degree);
          when '5' => Standard_Test_Conjugate(degree);
          when '6' => Standard_Test_Norm(degree);
          when '7' => Standard_Test_Shift(degree);
          when others => null;
        end case;
      when '1' => 
        case ans is 
          when '0' => DoblDobl_Construct;
          when '1' => DoblDobl_Test_Creation(degree);
          when '2' => DoblDobl_Test_Arithmetic(degree);
          when '3' => DoblDobl_Random_Test_Sqrt(degree);
          when '4' => DoblDobl_Random_Test_root(degree);
          when '5' => DoblDobl_Test_Conjugate(degree);
          when '6' => DoblDobl_Test_Norm(degree);
          when '7' => DoblDobl_Test_Shift(degree);
          when others => null;
        end case;
      when '2' =>
        case ans is 
          when '0' => QuadDobl_Construct;
          when '1' => QuadDobl_Test_Creation(degree);
          when '2' => QuadDobl_Test_Arithmetic(degree);
          when '3' => QuadDobl_Random_Test_Sqrt(degree);
          when '4' => QuadDobl_Random_Test_root(degree);
          when '5' => QuadDobl_Test_Conjugate(degree);
          when '6' => QuadDobl_Test_Norm(degree);
          when '7' => QuadDobl_Test_Shift(degree);
          when others => null;
        end case;
      when others => null;
    end case;
  end Main;

begin
  Main;
end ts_cseries;
