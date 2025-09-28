
;; Function main (main, funcdef_no=0, decl_uid=2344, cgraph_uid=1, symbol_order=0)

int main ()
{
  int i;
  int result;
  int n;
  int D.2354;

  n = 5;
  result = 1;
  i = 1;
  goto <D.2352>;
  <D.2351>:
  result = result * i;
  i = i + 1;
  <D.2352>:
  if (i <= n) goto <D.2351>; else goto <D.2349>;
  <D.2349>:
  printf ("The factorial of %d is %d\n", n, result);
  D.2354 = 0;
  goto <D.2355>;
  D.2354 = 0;
  goto <D.2355>;
  <D.2355>:
  return D.2354;
}


