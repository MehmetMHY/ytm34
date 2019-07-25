import time

text_file = open("links.txt", "r")
enter_file = open("enter.txt", "w")

value = "youtube-dl --extract-audio --audio-format mp3 "
lines = text_file.read().split('\n')

i = 0 ; counter = 0
while i < len(lines):
	if len(lines[i]) > 5:
		enter = value + lines[i] + "\n"
		enter_file.write(enter)
		counter = counter + 1
	i = i + 1

if counter == 0 or counter > 0:
	total = "[ Total # of Links: " + str(counter) + " ]"
	print() ; print(total)
	print("Loading...")
	time.sleep(1) ; print()

elif counter < 0:
	total = "[ Total # of Links: 0 ]"
	print("  → No entry, so No converting ...")

text_file.close() ; enter_file.close()