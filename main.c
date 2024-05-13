#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern size_t strlen(const char *str);
extern char *strchr(const char *str, int c);
extern char *strrchr(const char *str, int c);
extern int strcmp(const char *comp1, const char *comp2);
extern int strncmp(const char *s1, const char *s2, size_t n);
extern int strcasecmp(const char *s1, const char *s2);
extern char *strstr(const char *s1, const char *s2);
extern size_t strcspn(const char *s1, const char *s2);
extern char *strpbrk(const char *s1, const char *s2);
extern void *memset(void *s, int c, size_t n);
extern void *memcpy(void *dest, const void *src, size_t n);
extern void *memmove(void *dest, const void *src, size_t n);

int main() {
    const char *testStr = "Hello, World!";
    size_t length = strlen(testStr);
    printf("The length of \"%s\" is %zu.\n", testStr, length);

    char *found = strchr(testStr, 'o');
    if (found) {
        printf("Found 'o1' at position %s.\n", found);
    } else {
        printf("Did not find 'o1'.\n");
    }

    int pos = find_char(testStr, 'W');
    if (pos >= 0) {
        printf("Found 'W' at position %d.\n", pos);
    } else {
        printf("Did not find 'W'.\n");
    }

    char *found2 = strrchr(testStr, 'o');
    if (found2) {
        printf("Found 'o' at position %s.\n", found2);
    } else {
        printf("Did not find 'o'.\n");
    }

    const char *testStr2 = "Hello, World!!";
    printf("strcmp = %d\n", strcmp(testStr, testStr2));
    printf("real strcmp = %d\n", strcmp(testStr, testStr2));

    const char *testStr3 = "Hello, World";
    const char *testStr4 = "Hello, World!";
    printf("strncmp = %d\n", strncmp(testStr3, testStr4, 100));
    printf("real strncmp = %d\n", strncmp(testStr3, testStr4, 100));

    const char *testStr5 = "Hello, World!";
    const char *testStr6 = "o";
    printf("strcasecmp = %d\n", strcasecmp(testStr5, testStr6));
    printf("real strcasecmp = %d\n", strcasecmp(testStr5, testStr6));

    printf("strstr = %s\n", strstr(testStr5, testStr6));
    printf("real strstr = %s\n", strstr(testStr5, testStr6));

    printf ("strcspn = %ld\n", strcspn(testStr5, testStr6));
    printf("real strcspn = %ld\n", strcspn(testStr5, testStr6));

    printf("strpbrk = %s\n", strpbrk(testStr5, testStr6));
    printf("real strpbrk = %s\n", strpbrk(testStr5, testStr6));

    int *arr = (int *)malloc(10 * sizeof(int));
    for (int i = 0; i < 10; i++) {
        arr[i] = i;
    }
    printf("Before memset: ");
    for (int i = 0; i < 10; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    memset(arr, -1, 10 * sizeof(int));
    printf("After memset: ");
    for (int i = 0; i < 10; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    
    for (int i = 0; i < 10; i++) {
        arr[i] = i;
    }
    memset(arr, -1, 10 * sizeof(int));
    printf("After memset: ");
    for (int i = 0; i < 10; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    char *arr2 = (char *)malloc(10 * sizeof(char));
    for (int i = 0; i < 10; i++) {
        arr2[i] = i;
    }
    printf("Before memcpy: ");
    for (int i = 0; i < 10; i++) {
        printf("%d ", arr2[i]);
    }
    printf("\n");
    char *arr3 = (char *)malloc(10 * sizeof(char));
    memmove(arr3, arr2, 10 * sizeof(char));
    printf("After memcpy: ");
    for (int i = 0; i < 10; i++) {
        printf("%d ", arr3[i]);
    }
    printf("\n");
    
    free(arr);

    
    return 0;
}
