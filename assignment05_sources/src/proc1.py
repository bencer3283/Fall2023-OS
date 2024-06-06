import time

time.sleep(5)
current_time = time.strftime("%H:%M:%S")
with open("output.txt", "a") as file:
    file.write(f"started process: {current_time}\n")
time.sleep(5)
current_time = time.strftime("%H:%M:%S")
with open("output.txt", "a") as file:
    file.write(f"finished process: {current_time}\n")
