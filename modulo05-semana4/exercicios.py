from os import system
system('cls')

nomes = ['Abelardo', 'Aluisio', 'Adalberto', 'Anastacio', 'Ubirajara']

for i in nomes:
    print(i, end='\n\n')

print("Outra solução", end="\n\n")

i = 0
while i < len(nomes):
   print(nomes[i], end='\n\n')
   i += 1

def informa_nomes(lista_nomes):
    for i in nomes:
        print(i)

for i in nomes:
    if i[0] == 'A':
        print(i)