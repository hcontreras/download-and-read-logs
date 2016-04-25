# author: humberto.o.contreras@gmail.com
BEGIN {
  FS="|";
  count = 0;
  brazil = 0;
  tituloBrazil = "Requests from Brazil";
}

{
  tipos[$3]++;
}   
$2 ~ /^BR-\d*/ {brazil++};

END {
  printf("\n");
  for (tipo in tipos) {
    printf ("    %-20s: ", tipo);
    printf ("%6s", tipos[tipo]);
    printf ("\n");
  }
  printf("    %-20s: ", tituloBrazil);
  printf("%6s", brazil);
  printf("\n\n");
}
