-- Jacobus Burger
-- CMPT 360A, Spring 2021
-- Lab Assignment 4
-- Benchmarking the Sieve of Eratosthenes with Crystal and Ada
pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Real_Time; use Ada.Real_Time;


procedure Main is
  -- the sieve itself
  procedure sieve is
    n: Natural := 10_000;  -- size of array
    A: array(1 .. n) of Boolean := (1 => False, others => True);
    i: Natural := 2;
    j: Natural := i**2;
  begin
    -- find primes
    for i in 2 .. Natural(Sqrt(Float(n))) loop
      if A(i) then
        j := i**2;
        for k in 0 .. n loop
          exit when j + i * k > n;
          A(j + i * k) := False;
        end loop;
      end if;
    end loop;

    -- NOTE uncomment this section and comment out the bench proc to show primes
    -- show primes
    -- for i in 2 .. n loop
      -- if A(i) then
        -- Put_Line(Natural'Image(i));
      -- end if;
    -- end loop;
  end sieve;

  
  -- the benchmark
  procedure bench (max_repeat : in Integer) is
    start_time, stop_time: Time;
    elapsed_time: Time_Span;
  begin
    -- measure time of execution
    start_time := Clock;
    for i in 0 .. max_repeat loop
      sieve;
    end loop;
    stop_time := Clock;
    elapsed_time := stop_time - start_time;

    -- show elapsed time
    Put_Line("Elapsed time: "
        & Duration'Image(To_Duration(elapsed_time))
        & " seconds");
  end bench;
begin
  -- run just the sieve
  sieve;
  
  -- run the benchmark
  bench (10_000);
end Main;
