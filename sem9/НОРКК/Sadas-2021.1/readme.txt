*************************************************
* Замечания к установке ПК Sadas 98 *
*************************************************

Для правильной работы всех компоненотов ПК Sadas
правильно настройте Windows.

Для Windows 95/98/98SE/ME:

в файл config.sys добавьте строку:

device=%SystemRoot%\command\ansi.sys

Для Windows 2000/XP

в файл config.nt добавьте строку

device=%SystemRoot%\system32\ansi.sys