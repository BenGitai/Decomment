/* Decomment DFS */

/* Standard library incusions */
#include <stdio.h>
#include <stdlib.h>

/* Possible states of DFA */
enum State {NORMAL, SLASH, COMMENT, STAR, STRING, CHAR, ESCAPE_STRING, ESCAPE_CHAR};

/* State handlers */

/* Normal state handler
 * How to act when not in char, string, or potential comment */ 
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

/* Slash state
 * How to act after seeing a slash */
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

/* Comment state
 * What to do inside a comment */
enum State handleComment(int c, int *lineNum) {
    if (c == '*') {
        return STAR;
    }

    if (c == '\n') {
        putchar('\n');
    }

    return COMMENT;
}

/* Star state
 * How to act after seeing a star inside a comment */
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

/* Char state
 * How to act inside a char */
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

/* Escape Char state
 * How to act when seeing an escape char (\?) */
enum State handleEscapeChar(int c, int *lineNum) {
    putchar(c);
    return CHAR;
}

/* String state
 * How to act inside a string */
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

/* Escape String state
 * How to act when seeing an escape string (\?) */
enum State handleEscapeString(int c, int *lineNum) {
    putchar(c);
    return STRING;
}

int main(void) {
    /* Initialize vars, character in,
     * Line num and comment start line for error tracking
     * Initial state normal */
   int c;
   int lineNum = 1;
   int commentStartLine = 0;
   enum State state = NORMAL;

   /* Loop through input 
    * Use each states handler */
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
            break;

        case CHAR:
            state = handleChar(c, &lineNum);
            break;
        case ESCAPE_CHAR:
            state = handleEscapeChar(c, &lineNum);
            break;

        case STRING:
            state = handleString(c, &lineNum);
            break;

        case ESCAPE_STRING:
            state = handleEscapeString(c, &lineNum);
            break;
            
         default:
            break;
      }
   }
   
   /* Check if ended while still in a COMMENT state */
   if (state == COMMENT || state == STAR) {
      fprintf(stderr, "Error: line %d: unterminated comment\n", commentStartLine);
      return EXIT_FAILURE;
   }
   
   return EXIT_SUCCESS;
}

