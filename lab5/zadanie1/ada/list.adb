with Ada.Text_IO; use Ada.Text_IO;

package body list is
  function isEmpty(l: ListT) return Boolean is
  begin
    return l.first = null;
  end isEmpty;
  function Pop(l: in out ListT) return Integer is
    n: NodePtr := l.first;
    e: Integer := n.elem;
  begin
    l.first := n.next;
    if l.first = null then -- last element
      l.last := null;
    end if;
    Free(n);
    l.length := l.length - 1;
    return e;
  end Pop;
  procedure Push (l: in out ListT; e: Integer) is
    n: NodePtr := new Node;
  begin
    n.elem := e;
    n.next := l.first;
    l.first := n;
    if l.last = null then -- first element
      l.last := n;
    end if;
    l.length := l.length + 1;
  end Push;
  procedure Clean(l: in out ListT) is
    n: NodePtr := l.first;
    p: NodePtr := new Node;
  begin
    while n /= null loop
      p := n.next;
      Free(n);
      n := p;
    end loop;
    l.first := null;
    l.length := 0;
  end Clean;
  procedure Delete(l: in out ListT; I: Integer) is
    n: NodePtr := l.first;
    m: NodePtr := new Node;
  begin
     if I = 1 then
       l.first := n.next;
       free(n);
     else
       for J in 2 .. (i-1) loop
         n := n.next;
       end loop;
       m := n.next;
       n.next := m.next;
       Free(m);
     end if;
     l.length := l.length - 1;
  end Delete;
  function Get(l: in ListT; i: Integer) return Integer is
    n: NodePtr := l.first;
    e: Integer;
  begin
    for j in 2 .. i loop
      n := n.next;
    end loop;
    e := n.elem; 
    return e;
  end Get;
  procedure Put(l: in out ListT; I: Integer; E: Integer) is
    N: NodePtr := l.first;
  begin
    for J in 2 .. I loop
      N := N.next;
    end loop;
    N.elem := E;
  end Put;
  procedure Append (l: in out ListT; e: Integer) is
    n: NodePtr := new Node;
  begin
    n.elem := e;
    if l.first = null then -- first element
      l.first := n;
    else
      l.last.next := n;
    end if;
    l.last := n;
    l.length := l.length + 1;
  end Append;
  procedure Print(l: ListT) is
    n : NodePtr := l.first;
  begin
    while n /= null loop
      Put(n.elem'Image);
      n := n.next;
    end loop;
    Put_Line(" (" & Length(l)'Image & " ) ");
  end Print;
  procedure Insert(l: in out ListT; I: Integer; E: Integer) is
    N: NodePtr := l.first;
    M: NodePtr := new Node;
  begin
    if I = 1 then
      Push(l, E);
    elsif I = l.length + 1 then
      Append(l, E);
    else
      for J in 2 .. (i-1) loop
        N := N.next;
      end loop;
      M.next := N.next;
      N.next := M;
      M.elem := E;
      l.length := l.length + 1;
    end if;
  end Insert;
  function Length(l: ListT) return Integer is
  begin
    return l.length;
  end Length;
end list;
