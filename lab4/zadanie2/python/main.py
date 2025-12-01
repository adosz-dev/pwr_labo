import sys
from totient import totient

def main():
	if len(sys.argv) < 2:
		print("Podaj parametry!")
		return -1
	for i in sys.argv[1:]:
		result = totient(int(i))
		print(f"totient({i})={result}")

if __name__ == "__main__":
	main()

