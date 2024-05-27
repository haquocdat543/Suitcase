import color15
import webbrowser
import sys, os

####################################################################################################
# GET INPUT AND VARIABLES
####################################################################################################

# get argument as variables
option = sys.argv[1]

# define basic variables
one = 1

####################################################################################################
# URL DATA
####################################################################################################

# define list of url 

misc = [
'https://yentrinh.hashnode.dev/',
]

google = [
'https://www.google.com', 'https://www.gmail.com',
'https://www.drive.com',
]

youtube = [
'https://www.youtube.com',
'https://www.youtube.com/@learnthesky',
'https://www.youtube.com/@NeuralNine',
]

facebook = [
'https://www.facebook.com',
]

linkedin = [
'https://www.linkedin.com',
]

wikipedia = [
'https://www.wikipedia.org',
]

pinterest = [
'https://www.pinterest.com',
]

ai = [
'https://chatgpt.com',
'https://gemini.google.com/app',
]

cloud = [
'https://www.amazon.com',
'https://console.cloud.google.com',
]

github = [
'https://www.github.com',
'https://www.github.com/haquocdat543/Suitcase.git',
'https://www.github.com/hqdNotional/blockchain.git',
'https://www.github.com/notional-labs/cosmosia.git',
]

gitlab = [
'https://www.gitlab.com',
'https://www.gitlab.com/haquocdat543',
'https://www.gitlab.com/vba-aeronet-devops',
]

instagram = [
'https://www.instagram.com',
]

twitter = [
'https://www.twitter.com',
]

tiktok = [
'https://www.tiktok.com',
]

douyin = [
'https://www.douyin.com',
]

notional = [
'https://admin.notional.ventures/rpcs',
'https://snapshot.notional.ventures/',
]

detail = [
misc,
google,
youtube,
facebook,
linkedin,
wikipedia,
pinterest,
ai,
cloud,
github,
gitlab,
instagram,
twitter,
tiktok,
douyin,
notional,
]

####################################################################################################
# OGIC
####################################################################################################

# 1. Print list of urls
def print_array_by_index(array):
 order = 0
 for index in array:
  color15.printtc("00FF00" ,"array" ,"FFFFFF" , "[" , color15.CYAN, str(order) , "FFFFFF", "]" ,"00FF00", ":","FFFF00", index)
  order = order + 1

# 2. Print list of arrays
def print_array_by_index_v2(array):
 order = 0
 for index in array:
  color15.printtc("00FF00" ,"array" ,"FFFFFF" , "[" , color15.CYAN, str(order) , "FFFFFF", "]" ,"00FF00", ":","FFFF00", index[0])
  order = order + 1

# 2 - Open web browser with define number
def open_url(url):
  try:
    # print list of urls
    print_array_by_index_v2(url)

    # get input from user
    number = input("Enter number: ")
    number = int(number)

    # open web browser with given number
    webbrowser.open(url[number][0])

  except webbrowser.Error as e:
    print(f"Error opening URL: {e}")

# 4 - Open web browser with define number level2
def open_url_v2(array):
  try:
    # print list of default urls
    print_array_by_index_v2(array)

    # get input from user
    default_number = input("Enter default number: ")
    default_number = int(default_number)

    # print list of detail urls
    print_array_by_index(array[default_number])

    # get input from user
    detail_number = input("Enter detail number: ")
    detail_number = int(detail_number)

    # open web browser with detail number
    webbrowser.open(detail[default_number][detail_number])

  except webbrowser.Error as e:
    print(f"Error opening URL: {e}")

####################################################################################################
# SWITCH CASE OPTION
####################################################################################################

# switch case definition
def switch_case(option):
  """Processes option using match-case (Python 3.10+)"""
  match option:
    case "1":
      print("1: Web browser: ")
      open_url(detail)
    case "2":
      print("2: Browser v2: ")
      open_url_v2(detail)
    case _:
      print("Invalid option!")

# switch case implementation
switch_case(option)
