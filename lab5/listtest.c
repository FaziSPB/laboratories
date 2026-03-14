#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "list.h"
#include "list.c"

int main () {
char command [20];
bool cont = true ;
int r ;
list l = malloc (sizeof(list_t));
l->first = l->last = NULL ;
while ( cont ) {
printf ( " Command : " );
scanf ( "%s" , command );
if (!strcmp ( command , "pop" )) {
if (!is_empty( l )) {
r = pop(l);
printf ( " Result : %d\n " , r );
} else {
printf ( " Error - stack is empty !\n " );
}
}
else if (!strcmp ( command , "push" )) {
printf ( " Value : " );
scanf ( "%d" , &r );
push(l, r);
printf ( " Result : OK\n " );
}
else if (!strcmp ( command , "append" )) {
printf ( " Value : " );
scanf ( "%d" , &r );
append(l,r);
printf ( " Result : OK\n " );
}
else if (!strcmp ( command , "print" )) {
printf ( " Result : " );
print(l);
}
else if (!strcmp ( command , "length" )) {
r = length(l);
printf ( " Result : %d\n " , r );
}
else if (!strcmp ( command , "exit" )) {
cont = false ;
}
else if(!strcmp (command, "get")) {
            printf(" Index : ");
            scanf("%d", &r);
            int len = length(l);
            if (r >= 1 && r <= len) {
                r = get(l, r-1);
                printf(" Result : %d\n ", r);
            } else {
                printf(" Error - wrong index !\n ");
            }
        }
else if(!strcmp (command, "put")) {
            int i, e;
            printf(" Index : ");
            scanf("%d", &i);
            printf(" Value : ");
            scanf("%d", &e);
            int len = length(l);
            if (i >= 1 && i <= len) {
                put(l, i-1, e);
                printf(" Result : OK\n ");
            } else {
                printf(" Error - wrong index !\n ");
            }
        }
else if(!strcmp (command, "insert")) {
    int i, e;
    printf(" Index : ");
    scanf("%d", &i);
    printf(" Value : ");
    scanf("%d", &e);
    int len = length(l);
    if (i >= 1 && i <= len + 1) {
        insert(l, i - 1, e);
        printf(" Result : OK\n ");
    } else {
        printf(" Error - wrong index");
    }
}
else if(!strcmp (command, "del")) {
            int i;
            printf(" Index : ");
            scanf("%d", &i);
            int len = length(l);
            if (i >= 0 && i <= len) {
                del(l, i-1);
                printf(" Result : OK\n ");
            } else {
                printf(" Error - wrong index !\n ");
            }
        }
else if(!strcmp (command, "clean")) {
clean(l);
printf(" Result : OK\n ");
}
else
    printf(" Unknown command !\n ");
}
while (!is_empty(l)) 
    pop(l);
free(l);
return 0;
}