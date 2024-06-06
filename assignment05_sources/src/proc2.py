import signal
import sys
import time
import os

def signal_handler(signum, frame):
    signal_names = {
        signal.SIGINT: 'Ctrl+C (SIGINT)',
        signal.SIGTSTP: 'Ctrl+Z (SIGTSTP)',
        signal.SIGTERM: 'SIGTERM'
    }

    signal_name = signal_names.get(signum, f'Signal {signum}')
    current_time = time.strftime("%H:%M:%S")
    with open('output.txt', 'a') as file:
        file.write(f"Received {signal_name} at time {current_time}\n")

    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTSTP, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)


my_pid = os.getpid()

with open('output.txt', 'a') as file:
    file.write(f"Python process with PID {my_pid} started\n")

while True:
    time.sleep(0.1)