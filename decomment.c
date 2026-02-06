/* Decomment DFS */
#include <stdio.h>
#include <stdlib.h>

/* Define the possible states of our DFA */
enum State {NORMAL, SLASH, COMMENT, STAR, STRING, CHAR, ESCAPE_STRING, ESPACE_CHAR};

/* Function Prototypes: This is the "modularization" part */

enum State handleNormal(int c, int *lineNum) {
   if (c == '/') {
      return SLASH;
   } 
   if (c == '\"') {
      putchar(c);
      return STRING;
   }
   if (c == '\'') {
      putchar(c);
      return CHAR;
   }
   putchar(c);
   return NORMAL;
}

enum State handleSlash(int c, int *lineNum, int *commentStartLine) {
    if (c == '*') {
        putchar(' ');
        *commentStartLine = *lineNum;
        return COMMENT;
    }
    
    putchar('/');

    if (c == '/') {
        return SLASH;
    }

    if (c == '\"') {
        putchar(c);
        return STRING;
    }
    
    putchar(c);
    return NORMAL;
}

enum State handleComment(int c, int *lineNum) {
    if (c == '*') {
        return STAR:
    }

    if (c == '\n') {
        putchar('\n');
    }

    return COMMENT;
}

enum State handleStar(int c, int *lineNum) {
    if (c == '/') {
        return NORMAL;
    }

    if (c == '*') {
        return STAR;
    }

    if (c == '\n') {
        putchar('\n');
    }

    return COMMENT;
}

enum State handleChar(int c, int *lineNum) {
    if (c == '\'') {
        putchar(c);
        return NORMAL;
    }
    
    if (c == '\\') {
        putchar(c);
        return ESCAPE_CHAR;
    }

    putchar(c);
    return CHAR;
    
}

enum State handleEscapeChar(int c, int *lineNum) {
    putchar(c);
    return CHAR;
}

enum State handleString(int c, int *lineNum) {
    if (c == '\"') {
        putchar(c);
        return NORMAL;

    }

    if (c == '\\') {
        putchar(c);
        return ESCAPE_STRING;
    }

    putchar(c);
    return STRING;
}

enum State handleEscapeString(int c, int *lineNum) {
    putchar(c);
    return STRING;
}

int main(void) {
   int c;
   int lineNum = 1;
   int commentStartLine = 0;
   enum State state = NORMAL;
   
   while ((c = getchar()) != EOF) {
      if (c == '\n') {
         lineNum++;
      }
      
      switch (state) {
        case NORMAL:
            state = handleNormal(c, &lineNum);
            break;
            
        case SLASH:
            state = handleSlash(c, &lineNum, &commentStartLine);
            break;

        case COMMENT:
            state = handleComment(c, &lineNum);
            break;

        case STAR:
            state = handleStar(c, &lineNum);

        case CHAR:
            state = handleChar(c, &lineNum);

        case ESCAPE_CHAR:
            state = handleEscapeChar(c, &lineNum);

        case STRING:
            state = handleString(c, &lineNum);

        case ESCAPE_STRING:
            state = handleEscapeString(c, &lineNum);
            
         default:
            break;
      }
   }
   
   /* Logic to check if we ended while still in a COMMENT state */
   if (state == COMMENT || state == STAR) {
      fprintf(stderr, "Error: line %d: unterminated comment\n", commentStartLine);
      return EXIT_FAILURE;
   }
   
   return EXIT_SUCCESS;
}

