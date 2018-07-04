program qsort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
    a:array[1..1000]of integer ;
    i,n:integer;
    f1,f2:text;  

procedure q_sort(l,r:longint);
var
    i,j:longint;
    tit,q:integer;
begin
  i := l;     //передаю левую границу
  j := r;     //передаю правую границу
  q := a[(l+r) div 2]; //получаем эл-т посередине
  repeat
    while (a[i] < q) do
      inc(i);          //устанавливаем новую левую границу(отбрасываем эл-ты меньшие q)
    while (q < a[j]) do
      dec(j);          //устанавливаем новую правую границу(отбрасываем эл-ты большие q)
    if (i <= j) then
    begin
          tit:=a[i];
          a[i]:=a[j];            //обмен
          a[j]:=tit;
          inc(i);                //сдвиг границ 
          dec(j);
    end;
  until (i > j);
  if (l < j) then
                  q_sort(l,j);
  if (i < r) then
                  q_sort(i,r);
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }

  assignfile(f1,'input_qSort.txt'); reset(f1);
  assignfile(f2,'output_qSort.txt'); rewrite(f2);
  read(f1,n);
  For i:=1 to n do
    read(f1,a[i]);                //получаем массив
  q_sort(1,n);                    //вызываес сортировку массива от 1го до n-го элемента
  For i:=1 to n do
    write(f2,a[i],' ');           //Выводим отсортированный массив
  closefile(f1);
  closefile(f2);

end.
