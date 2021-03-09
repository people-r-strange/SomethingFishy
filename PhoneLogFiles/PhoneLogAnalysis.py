class PhoneCall:
  def __init__(self, date, weekday, number, receiver):
    self.date = date
    self.weekday = weekday
    self.number = number
    self.receiver = receiver

def gatherData():
  import csv
  with open("CleanPhoneLog.csv") as f:
    reader = csv.reader(f)
    data = []
    for row in reader:
      callObj = PhoneCall(row[0], row[1], row[2], row[3])
      data.append(callObj)
  return data

def phoneCallsByFrequency(data):
  phonesDict = {}
  for call in data:
    if call.receiver == "":
      continue
    elif call.receiver in phonesDict:
      phonesDict[call.receiver] =  phonesDict[call.receiver] + 1
    else:
      phonesDict[call.receiver] = 1

  print("Phone calls by fraquency:")
  for x in range(len(phonesDict)):
    currentMax = max(phonesDict, key=phonesDict.get )
    print(phonesDict[currentMax], currentMax)
    phonesDict.pop(currentMax)
  print("\n")

def callsByDate(data):
  date = input("What date are you insterested in? Ex.1/02/2002 \n")
  for call in data:
    if call.date == date:
      print(call.number, call.receiver)
  print("\n")

def callsToSwitzerland(data):
  print("Phone calls made to Switzerland:")
  for call in data:
    if (call.number).find("41 0") != -1:
      print(call.date, call.weekday, call.number, call.receiver)
  print("\n")

def callsToAttorneys(data):
  print("Phone calls made to Attorneys:")
  for call in data:
    if (call.receiver).find("Attorney") != -1:
      print(call.date, call.weekday, call.receiver)
  print("\n")

def callsToPrivateNumbers(data):
  print("Phone calls made to private numbers:")
  for call in data:
    if (call.receiver).find("Private") != -1:
      print(call.date, call.weekday, call.receiver)
  print("\n")

def main():
  data = gatherData()

  print("-"*20, "Welcome to the City Hall Phone Log", "-"*20)
  print("""You can perform the following operations: \n
              + To see phone calls orderded by frequency, type in Frequency\n
              + To see phone calls by date, type in Date\n
              + To see phone calls made to Switzerland, type in Swiss\n
              + To see phone calls made to attorneys, type in Att\n
              + To see phone calls made to private numbers, type in Private\n
              + To exit the program, type in Exit
            """)

  while True:
    selection = (input("What would you like to see today: ")).lower()

    if selection == "frequency":
      phoneCallsByFrequency(data)

    elif selection == "date":
      callsByDate(data)
    
    elif selection == "swiss":
      callsToSwitzerland(data)
    
    elif selection == "att":
      callsToAttorneys(data)
    
    elif selection == "private":
      callsToPrivateNumbers(data)
    
    elif selection == "exit":
      print("Goodbye!")
      break

    else:
      print("Woah! Looks like that is not a valid command, try again.\n")

main()
