#!/bin/bash

# Your birth date
birth_date="2001-02-10"
# Current date (dynamically set)
current_date=$(date +%Y-%m-%d)

# Convert dates to seconds since epoch
birth_seconds=$(date -d "$birth_date" +%s)
current_seconds=$(date -d "$current_date" +%s)

# Calculate difference in seconds
diff_seconds=$((current_seconds - birth_seconds))

# Calculate years, days, minutes
years=$((diff_seconds / 31536000))  # 365 * 24 * 60 * 60
days=$((diff_seconds / 86400))      # 24 * 60 * 60
minutes=$((diff_seconds / 60))

# Calculate days until next birthday
current_year=$(date -d "$current_date" +%Y)
next_birthday="$current_year-02-10"
next_birthday_seconds=$(date -d "$next_birthday" +%s)

# If next birthday has passed this year, use next year's
if [ "$next_birthday_seconds" -lt "$current_seconds" ]; then
  next_birthday="$((current_year + 1))-02-10"
  next_birthday_seconds=$(date -d "$next_birthday" +%s)
fi

days_until_birthday=$(((next_birthday_seconds - current_seconds) / 86400))

# Fetch a single random quote from Quotable API and extract both content and author
response=$(curl -k -s "https://api.quotable.io/random?maxLength=100")
quote=$(echo "$response" | grep -o '"content":"[^"]*' | cut -d'"' -f4)
author=$(echo "$response" | grep -o '"author":"[^"]*' | cut -d'"' -f4)

# Select ASCII art based on day of the month (1-31, rotating through 3 options)
day_of_month=$(date -d "$current_date" +%d)

# Select Tech Tip of the Day based on day of the month (rotating through 40 tips)
tip_index=$(( (day_of_month - 1) % 40 ))
case $tip_index in
  0) tech_tip="Use 'git stash' to temporarily save changes without committing." ;;
  1) tech_tip="In Vim, ':%s/old/new/g' replaces all occurrences of 'old' with 'new'." ;;
  2) tech_tip="Run 'docker ps -a' to see all containers, even stopped ones." ;;
  3) tech_tip="Add 'set -x' in a Bash script to debug by printing commands." ;;
  4) tech_tip="Use 'curl -I' to fetch only HTTP headers from a URL." ;;
  5) tech_tip="In Linux, 'top -i' ignores idle processes for a cleaner view." ;;
  6) tech_tip="Run 'kubectl get pods --all-namespaces' to see all cluster pods." ;;
  7) tech_tip="Use 'git log --oneline' for a compact commit history." ;;
  8) tech_tip="In Vim, 'ggVG' selects the entire file." ;;
  9) tech_tip="Check Docker container logs with 'docker logs <container_id>'." ;;
  10) tech_tip="Use 'chmod +x script.sh' to make a Bash script executable." ;;
  11) tech_tip="Run 'nginx -t' to test your Nginx config before reloading." ;;
  12) tech_tip="In Python, 'list[::-1]' reverses a list in one line." ;;
  13) tech_tip="Use 'docker-compose up -d' to start services in the background." ;;
  14) tech_tip="In Vim, 'Ctrl + u' scrolls up half a screen." ;;
  15) tech_tip="Run 'lsblk' to list block devices and their mount points." ;;
  16) tech_tip="Use 'git branch -D <branch>' to force delete a local branch." ;;
  17) tech_tip="In Bash, 'Ctrl + r' searches your command history." ;;
  18) tech_tip="Run 'kubectl describe pod <name>' for detailed pod info." ;;
  19) tech_tip="Use 'tail -f file.log' to monitor a log file in real-time." ;;
  20) tech_tip="In Go, 'go fmt' auto-formats your code." ;;
  21) tech_tip="Run 'docker system prune' to clean up unused resources." ;;
  22) tech_tip="In Vim, ':w !sudo tee %' saves a file with sudo privileges." ;;
  23) tech_tip="Use 'find . -name \"*.txt\"' to locate all .txt files." ;;
  24) tech_tip="Run 'git rebase -i HEAD~n' to interactively rebase last n commits." ;;
  25) tech_tip="In Linux, 'df -h' shows disk usage in human-readable format." ;;
  26) tech_tip="Use 'kubectl port-forward' to access a pod locally." ;;
  27) tech_tip="In Bash, '!!' repeats the last command." ;;
  28) tech_tip="Run 'docker exec -it <container> bash' to enter a container." ;;
  29) tech_tip="In Vim, 'u' undoes the last change, 'Ctrl + r' redoes it." ;;
  30) tech_tip="Use 'grep -r \"text\" .' to search for text in all files." ;;
  31) tech_tip="Run 'systemctl status <service>' to check a service’s state." ;;
  32) tech_tip="In Python, 'pip freeze > requirements.txt' lists dependencies." ;;
  33) tech_tip="Use 'docker inspect <container>' for detailed container info." ;;
  34) tech_tip="In Vim, ':set number' toggles line numbers." ;;
  35) tech_tip="Run 'watch -n 2 <command>' to repeat a command every 2 seconds." ;;
  36) tech_tip="Use 'git cherry-pick <commit>' to apply a specific commit." ;;
  37) tech_tip="In Bash, 'alias ll=\"ls -la\"' creates a shortcut for ls." ;;
  38) tech_tip="Run 'kubectl logs <pod>' to view a pod’s logs." ;;
  39) tech_tip="Use 'htop' instead of 'top' for a better process viewer." ;;
esac

# Select Mini Coding Challenge based on day of the month (rotating through 40 challenges)
challenge_index=$(( (day_of_month - 1) % 40 ))
case $challenge_index in
  0) challenge="Reverse a string in Go." ;;
  1) challenge="Count vowels in a string in Rust." ;;
  2) challenge="Find the factorial of a number in Python." ;;
  3) challenge="Create a simple pod in Kubernetes." ;;
  4) challenge="Build a Docker image for a static HTML page." ;;
  5) challenge="Sort an array of integers in Go." ;;
  6) challenge="Implement a linked list in Rust." ;;
  7) challenge="Parse a JSON file in Python." ;;
  8) challenge="Set up a Kubernetes deployment with 3 replicas." ;;
  9) challenge="Write a Dockerfile to run a Python script." ;;
  10) challenge="Check if a string is a palindrome in Go." ;;
  11) challenge="Sum an array of numbers in Rust." ;;
  12) challenge="Generate a Fibonacci sequence in Python." ;;
  13) challenge="Expose a Kubernetes service via NodePort." ;;
  14) challenge="Create a multi-stage Docker build for a Go app." ;;
  15) challenge="Find the max value in a slice in Go." ;;
  16) challenge="Implement a stack in Rust." ;;
  17) challenge="Count word frequency in a text file in Python." ;;
  18) challenge="Set up a Kubernetes ConfigMap for an app." ;;
  19) challenge="Dockerize a simple Flask API." ;;
  20) challenge="Reverse an integer in Go." ;;
  21) challenge="Filter even numbers from a vector in Rust." ;;
  22) challenge="Create a simple CLI tool in Python." ;;
  23) challenge="Deploy a stateless app in Kubernetes." ;;
  24) challenge="Build a Docker image for a Node.js app." ;;
  25) challenge="Convert decimal to binary in Go." ;;
  26) challenge="Implement a queue in Rust." ;;
  27) challenge="Scrape a webpage using Python." ;;
  28) challenge="Set up a Kubernetes ingress for an app." ;;
  29) challenge="Create a Docker volume for persistent data." ;;
  30) challenge="Find duplicates in a slice in Go." ;;
  31) challenge="Calculate the GCD of two numbers in Rust." ;;
  32) challenge="Sort a list of strings by length in Python." ;;
  33) challenge="Create a Kubernetes job to run a task." ;;
  34) challenge="Write a Docker Compose file for a web app + DB." ;;
  35) challenge="Check if a number is prime in Go." ;;
  36) challenge="Merge two sorted arrays in Rust." ;;
  37) challenge="Generate random passwords in Python." ;;
  38) challenge="Set up a Kubernetes secret for API keys." ;;
  39) challenge="Run a cron job in a Docker container." ;;
esac

# # Create the dynamic section for README.md with tech tip and coding challenge
# dynamic_section="## My Age (As of $current_date)\n"
# dynamic_section+="I am $years years old  \n"
# dynamic_section+="I am $days days old  \n"
# dynamic_section+="I am $minutes minutes old  \n"
# dynamic_section+="My next birthday is in $days_until_birthday days!  \n\n"
dynamic_section+="> \"$quote\" - $author\n\n"
dynamic_section+="## Tech Tip of the Day\n"
dynamic_section+="$tech_tip\n\n"
dynamic_section+="## Mini  Challenge\n"
dynamic_section+="Today’s Challenge: $challenge"

# Update README.md using a temporary file
marker="## My Age (As of"
temp_file=$(mktemp)

if grep -q "$marker" README.md; then
  # Copy content up to the marker to temp file, then append dynamic section
  sed "/$marker/Q" README.md > "$temp_file"
  echo -e "$dynamic_section" >> "$temp_file"
else
  # If marker not found, copy entire file and append dynamic section
  cp README.md "$temp_file"
  echo -e "\n$dynamic_section" >> "$temp_file"
fi

# Replace original README.md with updated content
mv "$temp_file" README.md
