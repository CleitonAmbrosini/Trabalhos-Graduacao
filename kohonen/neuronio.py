import numpy as np
import random

class Neuronio:
	def __init__ (self):
		# 22562846870400
		# 22562849462399
		self.pesos = np.array(self.aleatorio())

	def aleatorio(self):
		lista = [random.uniform(22562846870000, 22562849464399),
				 random.uniform(20, 30),
				 random.uniform(20, 35),
				 random.uniform(100, 2000),
				 random.uniform(100, 2000),
				 random.uniform(0, 1)]
		return lista


	def soma_de_pesos(self, entrada):
		return sum((entrada - self.pesos) ** 2)
