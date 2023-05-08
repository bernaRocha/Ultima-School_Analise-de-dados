from os import system
system('cls')

numero1 = int(input('Digite um número: '))
numero2 = int(input('Digite o segundo: '))

soma = numero1 + numero2
subtracao = numero1 - numero2
multiplicacao = numero1 * numero2
divisao = numero1 / numero2
exponenciacao = numero1 ** numero2
divisao_inteira = numero1 // numero2
resto_divisao = numero1 % numero2

print(f'A soma de {numero1} com o {numero2} é {soma}')
print(f'A subtração de {numero1} com {numero2} é {subtracao}')
print(f'A multiplicação de {numero1} com {numero2} é {multiplicacao}')
print(f'A divisão de {numero1} com {numero2} é {divisao:.2f}')
print(f'A exponenciação de {numero1} com {numero2} é {exponenciacao}')
print(f'A divisão inteira de {numero1} com {numero2} é {divisao_inteira}')
print(f'O resto da divisão de {numero1} com {numero2} é {resto_divisao}')