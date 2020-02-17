from neuronio import *
from math import e
class Grade:
	def __init__(self):
		self.grade = self.create_grade([10,10])
		self.bmu = None
		self.alpha = 0.1
		self.sigma = 2
		self.s_taxa = 0.0015
		self.taxa = 0.00009

	def create_grade(self, tamanho):
		grade = []
		for i in range(tamanho[0]):
			linha = []
			for j in range(tamanho[1]):
				linha.append(Neuronio())
			grade.append(linha)
		return grade


	'''
	Retorna o neurônio que reconhece a entrada, que é o BMU para a entrada.
	'''

	def reconhece2(self, entrada):
		#   Retorna o BMU para a entrada
		return self.melhor_neuronio(entrada)

	def melhor_neuronio(self, entrada):
		tam_grade = [10, 10]
		melhor = ((0, 0), self.grade[0][0].soma_de_pesos(entrada))
		for i in range(0, tam_grade[0]):
			for j in range(0, tam_grade[1]):
				sd = self.grade[i][j].soma_de_pesos(entrada)
				if sd < melhor[1]:
					melhor = ((i, j), sd)
		return melhor

	def treinar(self, entrada_de_treino):
		print("Treinando")
		alpha = self.alpha
		for i in entrada_de_treino:
			self.iteracao(i, alpha)
	def iteracao(self, entrada, alpha):
		#   Encontra o BMU
		self.BMU = self.melhor_neuronio(entrada)

		#   Repesa a vizinhança
		for i in self.vizinhos(self.BMU[0]):
			self.grade[i[0]][i[1]].pesos = self.repesa_neuronio((i[0], i[1]), entrada, alpha)


	def repesa_neuronio(self, indice_neuronio, entrada, alpha):
		neuronio = self.grade[indice_neuronio[0]][indice_neuronio[1]]
		return neuronio.pesos + self.vizinhanca2(indice_neuronio) * alpha * (entrada - neuronio.pesos)


	def vizinhanca2(self, indice_neuronio):
		#   Calcula a distância euclidiana na grade entre o neuronio atual e o BMU
		melhor = self.grade[self.BMU[0][0]][self.BMU[0][1]]
		S = dist_eclidiana(indice_neuronio, self.BMU[0])

		#   Retorna o cálculo de vizinhança
		return e ** ((-(S ** 2)) / (2 * ((self.sigma) ** 2)))



	'''
	Função para pegar os 8 vizinhos de um neurônio. Recebe os indices da matriz
	e retorna a lista de vizinhos.
	'''
	def vizinhos(self, pos):
		vizinhos = []
		tam_grade = [10, 10]
		if pos[0] + 1 in range(tam_grade[0]) and pos[1] in range(tam_grade[1]):
			vizinhos.append([pos[0] + 1, pos[1]])

		if pos[0] in range(tam_grade[0]) and pos[1] + 1 in range(tam_grade[1]):
			vizinhos.append([pos[0], pos[1] + 1])

		if pos[0] in range(tam_grade[0]) and pos[1] - 1 in range(tam_grade[1]):
			vizinhos.append([pos[0], pos[1] - 1])

		if pos[0] - 1 in range(tam_grade[0]) and pos[1] + 1 in range(tam_grade[1]):
			vizinhos.append([pos[0] - 1, pos[1] + 1])

		if pos[0] - 1 in range(tam_grade[0]) and pos[1] - 1 in range(tam_grade[1]):
			vizinhos.append([pos[0] - 1, pos[1] - 1])

		if pos[0] + 1 in range(tam_grade[0]) and pos[1] - 1 in range(tam_grade[1]):
			vizinhos.append([pos[0] + 1, pos[1] - 1])

		if pos[0] + 1 in range(tam_grade[0]) and pos[1] - 1 in range(tam_grade[1]):
			vizinhos.append([pos[0] + 1, pos[1] - 1])

		if pos[0] - 1 in range(tam_grade[0]) and pos[1] in range(tam_grade[1]):
			vizinhos.append([pos[0] - 1, pos[1]])

		self.neighbors_size = len(vizinhos)
		return vizinhos


'''
Função de distância euclidiana entre dois pontos.
'''
def dist_eclidiana(a, b):
    return ((a[0] - b[0])**2 + (a[1] - b[1])**2)**(1/2)
