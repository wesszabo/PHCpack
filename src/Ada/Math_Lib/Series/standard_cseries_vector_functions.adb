with Standard_Complex_Series_Functions;

package body Standard_CSeries_Vector_Functions is

  function Eval ( v : Standard_Complex_Series_Vectors.Vector;
                  t : double_float )
                return Standard_Complex_Vectors.Vector is

    res : Standard_Complex_Vectors.Vector(v'range);

  begin
    for k in v'range loop
      res(k) := Standard_Complex_Series_Functions.Eval(v(k),t);
    end loop;
    return res;
  end Eval;

  function Eval ( v : Standard_Complex_Series_Vectors.Vector;
                  t : Complex_Number )
                return Standard_Complex_Vectors.Vector is

    res : Standard_Complex_Vectors.Vector(v'range);

  begin
    for k in v'range loop
      res(k) := Standard_Complex_Series_Functions.Eval(v(k),t);
    end loop;
    return res;
  end Eval;

  function Eval ( v : Standard_Complex_Series_Vectors.Vector;
                  w : Standard_Integer_Vectors.Vector;
                  t : double_float )
                return Standard_Complex_Vectors.Vector is

    res : Standard_Complex_Vectors.Vector(v'range);

  begin
    for k in v'range loop
      res(k) := Standard_Complex_Series_Functions.Eval(v(k),t,w(k),w(w'last));
    end loop;
    return res;
  end Eval;

  function Eval ( v : Standard_Complex_Series_Vectors.Vector;
                  w : Standard_Integer_Vectors.Vector;
                  t : Complex_Number )
                return Standard_Complex_Vectors.Vector is

    res : Standard_Complex_Vectors.Vector(v'range);

  begin
    for k in v'range loop
      res(k) := Standard_Complex_Series_Functions.Eval(v(k),t,w(k),w(w'last));
    end loop;
    return res;
  end Eval;

end Standard_CSeries_Vector_Functions;
