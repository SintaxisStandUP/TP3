%top{
#include <stdio.h>
#include "tokens.h"
}
%option header-file="scanner.h"
%option outfile="scanner.c"
%option noinput
%option nounput

L [[:alpha:]]
D [0-9]
LD [[:alnum:]]
S [[:space:]]
O [[:punct:]]{-}[/,/./(/)/+/-/*//]

programa [Pp][Rr][Oo][Gg][Rr][Aa][Mm][Aa]
variables [Vv][Aa][Rr][Ii][Aa][Bb][Ll][Ee][Ss]
codigo [Cc][Oo][Dd][Ii][Gg][Oo]
fin [Fi][Ii][Nn]
leer [Ll][Ee][Ee][Rr]
escribir [Ee][Ss][Cc][Rr][Ii][Bb][Ii][Rr]
definir [Dd][Ee][Fi][Ii][Nn][Ii][Rr]
%%
"//".*|" "|\t|\n    ; 
programa			return PROG;
variables			return VAR;
codigo				return COD;
fin					return FIN;
leer				return LEER;
escribir			return ESC;
definir				return DEF;
"+"					return OP_SUM;
"-"					return OP_REST;
"*"					return OP_MULT;
"/"					return OP_DIV;
"<-"				return ASIG;
"("					return PAR_I;
")"					return PAR_D;
","					return COMA;
"."					return PTO;
{L}{LD}*			return ID;
{D}+				return CTE;
{D}+[{L}{O}][{LD}{O}]*	return ERROR_C;
{L}+{O}+[{LD}{O}]*	return ERROR_I;
{O}+[{LD}{O}]*		return ERROR_L;  
%%