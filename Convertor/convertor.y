%{

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int yylex(void);
extern void yyerror(const char *s);

%}

%union
{
    float fval;       // Valoare numerica de tip float
    char *sval;       // Sir de caractere
    struct 
    {
        float value;  // Valoare calculata de tip float
        char *unit;   // Unitatea de masura asociata
    } result;
}

%type <result> program
%type <result> conversion
%token <fval> NUMAR
%token <sval> UNITATE IN


%%

program: program conversion '\n'
{
    printf("Rezultat: %.2f %s\n", $2.value, $2.unit);
}
| /* nimic */
{
    // Actiune goală (nu face nimic), ajuta sa pot scrie mai multe conversii fara sa inchid consola
}
;

conversion: NUMAR UNITATE IN UNITATE
{
    if (strcmp($2, "kilometri") == 0 && strcmp($4, "mile") == 0) 
    {
        $$.value = $1 * 0.621371;
        $$.unit = strdup($4); // Copiaza unitatea in care s-a facut conversia
    } 
    else if (strcmp($2, "mile") == 0 && strcmp($4, "kilometri") == 0) 
    {
        $$.value = $1 * 1.60934;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "metri") == 0 && strcmp($4, "picioare") == 0) 
    {
        $$.value = $1 * 3.28084;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "picioare") == 0 && strcmp($4, "metri") == 0) 
    {
        $$.value = $1 * 0.3048;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "centimetri") == 0 && strcmp($4, "inchi") == 0) 
    {
        $$.value = $1 * 0.393701;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "inchi") == 0 && strcmp($4, "centimetri") == 0) 
    {
        $$.value = $1 * 2.54;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "kilograme") == 0 && strcmp($4, "pounds") == 0) 
    {
        $$.value = $1 * 2.20462;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "pounds") == 0 && strcmp($4, "kilograme") == 0) 
    {
        $$.value = $1 * 0.453592;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "grame") == 0 && strcmp($4, "uncii") == 0) 
    {
        $$.value = $1 * 0.035274;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "uncii") == 0 && strcmp($4, "grame") == 0) 
    {
        $$.value = $1 * 28.3495;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "secunde") == 0 && strcmp($4, "minute") == 0) 
    {
        $$.value = $1 / 60;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "minute") == 0 && strcmp($4, "secunde") == 0) 
    {
        $$.value = $1 * 60;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "celsius") == 0 && strcmp($4, "fahrenheit") == 0) 
    {
        $$.value = $1 * (9 / 5) + 32;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "fahrenheit") == 0 && strcmp($4, "celsius") == 0) 
    {
        $$.value = ($1 - 32) * (5 / 9);
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "celsius") == 0 && strcmp($4, "kelvin") == 0) 
    {
        $$.value = $1 + 273.15;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "kelvin") == 0 && strcmp($4, "celsius") == 0) 
    {
        $$.value = $1 - 273.15;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "fahrenheit") == 0 && strcmp($4, "kelvin") == 0) 
    {
        $$.value = ($1 - 32) * (5 / 9) + 273.15;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "kelvin") == 0 && strcmp($4, "fahrenheit") == 0) 
    {
        $$.value = ($1 - 273.15) * (9 / 5) + 32;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "litri") == 0 && strcmp($4, "galoane") == 0) 
    {
        $$.value = $1 * 0.264172;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "galoane") == 0 && strcmp($4, "litri") == 0) 
    {
        $$.value = $1 * 3.78541;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "metri_patrati") == 0 && strcmp($4, "acri") == 0) 
    {
        $$.value = $1 * 0.000247105;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "acri") == 0 && strcmp($4, "metri_patrati") == 0) 
    {
        $$.value = $1 * 4046.86;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "calorii") == 0 && strcmp($4, "kilocalorii") == 0) 
    {
        $$.value = $1 / 1000;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "kilocalorii") == 0 && strcmp($4, "calorii") == 0) 
    {
        $$.value = $1 * 1000;
        $$.unit = strdup($4); 
    }

    else if (strcmp($2, "bari") == 0 && strcmp($4, "atmosfere") == 0) 
    {
        $$.value = $1 * 0.986923;
        $$.unit = strdup($4); 
    }
    else if (strcmp($2, "atmosfere") == 0 && strcmp($4, "bari") == 0) 
    {
        $$.value = $1 * 1.01325;
        $$.unit = strdup($4); 
    }

    else 
    {
        yyerror("Conversie necunoscuta!");
        $$.value = 0;
        $$.unit = strdup("eroare");
    }

};


%%

void yyerror(const char *s)
{
	fprintf(stderr, "Eroare: %s\n", s);
}

int main(void)
{
    printf("Conversii disponibile:\n");
    printf("kilometri <-> mile\n");
    printf("metri <-> picioare\n");
    printf("centimetri <-> inchi\n");
    printf("kilograme <-> pounds\n");
    printf("grame <-> uncii\n");
    printf("secunde <-> minute\n");
    printf("celsius <-> fahrenheit\n");
    printf("celsius <-> kelvin\n");
    printf("fahrenheit <-> kelvin\n");
    printf("litri <-> galoane\n");
    printf("metri_patrati <-> acri\n");
    printf("calorii <-> kilocalorii\n");
    printf("bari <-> atmosfere\n");
    
    printf("\nIntrodu conversia (ex: 10 kilometri in mile):\n");
    yyparse();  // Asteapta si proceseaza o linie de input
	return 0;
}