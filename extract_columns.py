# Nome do arquivo de entrada
nome_arquivo = "SraRunTable.txt"

# Nome do arquivo de saída
nome_arquivo_saida = "output.txt"

# Listas para armazenar os valores desejados
primeira_coluna = []
ultima_coluna = []

# Abrir o arquivo e ler as linhas
with open(nome_arquivo, 'r') as arquivo:
    linhas = arquivo.readlines()
    
    # Iterar sobre cada linha do arquivo, excluindo o cabeçalho
    for linha in linhas[1:]:
        # Dividir a linha em colunas usando a vírgula como separador
        colunas = linha.strip().split(',')
        
        # Obter a primeira coluna
        primeira = colunas[0]
        
        # Obter a última coluna
        ultima = colunas[-1]
        
        # Extrair apenas os números desejados
        valor_final = ultima.split("_")[1].split(".")[0]
        
        # Adicionar os valores às respectivas listas
        primeira_coluna.append(primeira)
        ultima_coluna.append(valor_final)

# Criar o arquivo de saída e escrever os valores das duas colunas
with open(nome_arquivo_saida, 'w') as arquivo_saida:
    for i in range(len(primeira_coluna)):
        linha_saida = primeira_coluna[i] + " " + ultima_coluna[i] + "\n"
        arquivo_saida.write(linha_saida)
