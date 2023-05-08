from os import system
system('cls')

"""
Exercícios Condicionais
1 -  Faça um programa que peça dois números e imprima o maior deles.
2 - Faça um script que peça um valor e mostre na tela se o valor é positivo ou negativo.
3 - Crie um programa que verifique se uma letra digitada é "F" ou "M". 
Conforme a letra escrever: F - Feminino, M - Masculino, Sexo Inválido.
4 - Crie um código em linguagem Python que peça o nome do usuário por meio da função input (). Se o nome for "Ultima", imprima "Bem-vindo, você é um(a) exclenete aluno(a)". Caso contrário, imprima "Bom dia, NOME". (Substitua o NOME pelo nome do usuário).
5 -  Escrever um programa em Python para ler um número inteiro e informar se ele é divisível por 5.
6 - Escreva um programa Python para verificar se uma letra do Alfabeto(Abecedário) é uma vogal ou consoante.
"""

# Exercício 1
num1 = int(input("Digite um número: "))
num2 = int(input("Digite outro: "))

if num1 > num2:
   print(f"O maior número é: {num1}")
else:
   print(f"O maior número é: {num2}")

# Exercício 2

print("Verificando se é positivo ou negativo")
num = int(input("Digite um valor: "))

if num > 0:
   print(f"O valor {num} é positivo.")
else:
   print(f"O valor {num} é negativo.")

# Exercício 3

sexo = input('Informe seu sexo: [M/F]: ').strip().upper()[0]
while sexo not in 'MF':
    sexo = input('Dados inválidos. Informe seu sexo: [M/F] ').strip().upper()[0]

print(f'Registrado com sucesso, sexo: {sexo}.')

# Exercício 4

nome = input("Digite seu nome: ")

if nome == "Ultima":
   print("Bem-vindo, você é um(a) exclenete aluno(a)")
else: 
   print(f"Bom dia, {nome}")

# Exercício 5

numero = int(input("Digite um número: "))

if numero / 5 == 0:
   print(f"O número {numero} é divisível por cinco.")
else:
   print(f"O número {numero} NÃO é divisível por cinco.")

# Exercício 6

letra = input("Digite uma letra: ").lower()[0]

if letra in 'aeiou':
   print(f"A letra {letra} é uma vogal")
else:
   print(f"A letra {letra} é uma consoante")