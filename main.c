*	TP 03	FLEX	2018

	INTEGRANTES				GRUPO	02

			Cortez, Fracisco Andres 1638130
			Kuric, Mariela			1627740
			Storozuk, Irina Belen	1634355
			Vazquez, Candela Daiana	1646916	

*/

#include <stdio.h>
#include "scanner.h"


char *nombres_token[]={"", "Identificador", "Constante" "programa" "variables" "codigo",
"fin", "leer", "escribir", "definir", "+", "-", "*", "/", "Asignacion", "(", ")", 
",", ".", "Error lexico","Constante invalida", "Identificador invalido"};

int main(){
	enum token t;
	while ((t=yylex())){
		if (t==1 | t==2 |t==19 | t==20 | t==21)
			printf ("Token: %s\tLexema: %s\n", nombres_token[t], yytext);
		else
			printf ("Token: %s\n", nombres_token[t]);
	}
	printf ("Token: Fin de archivo");
}