#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void    ft_printf(char *str, ...)
{
	int			i = 0;
	int			x = 0;
    va_list    var_list;

	va_start(var_list, str);
	while (str[i])
	{
		char ch = str[i];
		if (ch == '%')
			x++;
            write(1, &ch, 1);
        i++;
    }
	printf("x = %d\n", x);
	while (x > 0)
	{
		printf("f0\n");
		printf("%ld\n", va_arg(var_list, long));
		printf("f1\n");
		x--;
	}
}
