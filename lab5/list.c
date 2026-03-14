#include <stdio.h>
#include <stdlib.h>
#include "list.h"

bool is_empty(list l) {
    return l->first == NULL;
}

int pop(list l) {
    node_ptr n = l->first;
    int e = n->elem;
    l->first = l->first->next;
    if (l->first == NULL) {
        l->last = NULL;
    }
    free(n);
    return e;
}
void push(list l, int e) {
    node_ptr n = malloc(sizeof(node));
    n->elem = e;
    n->next = l->first;
    l->first = n;
    if (l->last == NULL) {
        l->last = n;
    }
}
void append(list l, int e) {
    node_ptr n = malloc(sizeof(node));
    n->elem = e;
    if (l->first == NULL) 
       l->first = n;
    else
       l->last->next = n;
    l->last = n;
}
void print(list l) {
    node_ptr n = l->first;
    while (n != NULL) {
        printf("%d ", n->elem);
        n = n->next;
    }
    printf(" ( %d )\n", length(l));
}
int length(list l) {
    int i = 0;
    node_ptr n = l->first;
    while (n != NULL) {
        i++;
        n = n->next;
    }
    return i;
}
int get(list l, int i) {
    node_ptr n = l->first;
    for (int j = 0; j < i; j++) {
        n = n->next;
    }
    return n->elem;
}

void put(list l, int i, int e) {
    node_ptr n = l->first;
    for (int j = 0; j < i; j++) {
        n = n->next;
    }
    n->elem = e;    
}

void insert(list l, int i, int e) {
    if (i == 0) {
        push(l, e);
        return;
    }
    node_ptr n = l->first;
    for (int j = 0; j < i - 1; j++) {
        if (n == NULL) return; 
        n = n->next;
    }
    node_ptr new_node = malloc(sizeof(node));
    new_node->elem = e;
    new_node->next = n->next;
    n->next = new_node;
    
    if (new_node->next == NULL) {
        l->last = new_node;
    }
}

void del(list l, int i) {
    if (i == 0) {
        pop(l);
        return;
    }
    
    node_ptr n = l->first;
    for (int j = 0; j < i - 1; j++) {
        n = n->next;
    }
    
    node_ptr to_delete = n->next;
    n->next = to_delete->next;

    if (n->next == NULL) {
        l->last = n;
    }
    free(to_delete);
}
void clean(list l) {
    while (!is_empty(l)) {
        pop(l);
    }
}