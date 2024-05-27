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

# define list of url
url = [
'https://www.google.com',
'https://www.youtube.com',
'https://www.facebook.com',
'https://www.linkedin.com',
'https://www.wikipedia.org',
'https://www.pinterest.com',
'https://aws.amazon.com',
'https://github.com/haquocdat543/Suitcase.git',
'https://www.instagram.com',
'https://www.twitter.com',
'https://www.tiktok.com',
'https://www.douyin.com',
'https://www.gitlab.com',
]

google = [
'https://www.google.com',
'https://www.gmail.com',
'https://www.drive.com',
]

youtube = [
'https://www.youtube.com',
'https://www.youtube.com/@learnthesky',
'https://www.youtube.com/@NeuralNine',
]

detail = [
google,
youtube,
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
    print_array_by_index(url)

    # get input from user
    number = input("Enter number: ")
    number = int(number)

    # open web browser with given number
    webbrowser.open(url[number])

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
      open_url(url)
    case "2":
      print("2: Browser v2: ")
      open_url_v2(detail)
    case _:
      print("Invalid option!")

# switch case implementation
switch_case(option)
