with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

package body list is

   function isEmpty (l : ListT) return Boolean is
   begin
      return l.first = null;
   end isEmpty;
 
   function Pop (l : in out ListT) return Integer is
      n : NodePtr := l.first;
      e : Integer := n.elem;
   begin
      l.first := n.next;
      if l.first = null then 
         l.last := null;
      end if;
      Free(n);
      return e;
   end Pop;

   procedure Push (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      n.next := l.first;
      l.first := n;
      if l.last = null then 
         l.last := n;
      end if;
   end Push;

   procedure Append (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      if l.first = null then 
         l.first := n;
      else
         l.last.next := n;
      end if;
      l.last := n;
   end Append;

   procedure Print (l : ListT) is
      n : NodePtr := l.first;
   begin
      while n /= null loop
         Put(n.elem'Image);
         n := n.next;
      end loop;
      Put_Line(" (" & Length(l)'Image & " )");
   end Print;

   function Length (l : ListT) return Integer is
      i : Integer := 0;
      n : NodePtr := l.first;
   begin
      while n /= null loop
         i := i + 1;
         n := n.next;
      end loop;
      return i;
   end Length;

   function Get (l : ListT; i : Integer) return Integer is
      n : NodePtr := l.first;
   begin
      for k in 1 .. i loop
         if n /= null then
            n := n.next;
         end if;
      end loop;
      return n.elem;
   end Get;

   procedure Put (l : in out ListT; i : Integer; e : Integer) is
      n : NodePtr := l.first;
   begin
      for k in 1 .. i loop
         if n /= null then
            n := n.next;
         end if;
      end loop;
      if n /= null then
         n.elem := e;
      end if;
   end Put;

   procedure Insert (l : in out ListT; i : Integer; e : Integer) is
      n : NodePtr := l.first;
      new_node : NodePtr;
   begin
      if i = 0 then
         Push(l, e);
         return;
      end if;

      for k in 1 .. i - 1 loop
         if n /= null then
            n := n.next;
         end if;
      end loop;

      if n /= null then
         new_node := new Node;
         new_node.elem := e;
         new_node.next := n.next;
         n.next := new_node;

         if new_node.next = null then
            l.last := new_node;
         end if;
      end if;
   end Insert;

   procedure Del (l : in out ListT; i : Integer) is
      n : NodePtr := l.first;
      to_delete : NodePtr;
      ignored : Integer;
   begin
      if i = 0 then
         ignored := Pop(l);
         return;
      end if;

      for k in 1 .. i - 1 loop
         if n /= null then
            n := n.next;
         end if;
      end loop;

      if n /= null and then n.next /= null then
         to_delete := n.next;
         n.next := to_delete.next;
         
         if n.next = null then
            l.last := n;
         end if;
         
         Free(to_delete);
      end if;
   end Del;

   procedure Clean (l : in out ListT) is
      ignored : Integer;
   begin
      while not isEmpty(l) loop
         ignored := Pop(l);
      end loop;
   end Clean;

end list;