from leitura import *
from grade import *

#Conversão da data pra inteiro pode dar merda
#lido = leitura_entrada('arquivos/teste.txt')

gr = Grade()
treino = leitura_entrada("arquivos/datatraining.txt")
for i in range(10):
    gr.treinar(treino)
    gr.alpha -= gr.taxa
    gr.sigma -= gr.s_taxa
