(* Name: Jacobus Burger             *)
(* Student ID: 556652               *)
(* CMPT 360 A, Spring 2021          *)
(* Lab Assignment 2                 *)
(* Quicksort with Python and Pascal *)
program quicksort;


(* pretty print an array *)
procedure showarray(const arr: array of integer);
var
  i: integer;
begin
  writeln('[');
  for i := low(arr) to high(arr) do
    writeln(arr[i], ',');
  writeln(']');
  writeln;
  writeln;
end;


function partition(var arr: array of integer; l, h: integer): integer;
var
  pivot, temp, i, j: integer;
begin
  pivot := arr[h];
  i := l;
  for j := l to h do
    if arr[j] < pivot then
    begin
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
      i := i + 1;
    end;
  temp := arr[h];
  arr[h] := arr[i];
  arr[i] := temp;
  partition := i; (* odd, but rick helped this make sense *)
end;


procedure quicksort(var arr: array of integer; l, h: integer);
var
  part: integer;
begin
  if l < h then
  begin
    part := partition(arr, l, h);
    quicksort(arr, l, part - 1);
    quicksort(arr, part + 1, h)
  end;
end;


var
  i: integer;
  (* create 3 arrays of size 100, 1000, and 10000 *)
  arr1: array [1..100] of integer;
  arr2: array [1..1000] of integer;
  arr3: array [1..10000] of integer;
begin
  (* assign random values to indices of each array *)
  randomize;
  for i := 0 to 100 do
    arr1[i] := random(100 + 1);
  for i := 0 to 1000 do
    arr2[i] := random(1000 + 1);
  for i := 0 to 10000 do
    arr3[i] := random(10000 + 1);

  (* show input arrays *)
  writeln('===== INPUT =====');
  showarray(arr1);
  showarray(arr2);
  showarray(arr3);

  (* sort arrays *)
  quicksort(arr1, 0, length(arr1) - 1);
  quicksort(arr2, 0, length(arr2) - 1);
  quicksort(arr3, 0, length(arr3) - 1);

  (* show output arrays *)
  writeln('===== OUTPUT =====');
  showarray(arr1);
  showarray(arr2);
  showarray(arr3);
end.
