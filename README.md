fetch_logs.sh
Overview
fetch_logs.sh is a shell script designed to automate the process of fetching logs from pods in a Kubernetes namespace and storing them locally on your machine.

Table of Contents
Overview
Why Shell Scripts?
Features
Usage
Example
Contributing
Feedback
License
Why Shell Scripts?
Shell scripts are powerful tools used by DevOps engineers to:

Automate: Automate repetitive tasks like log collection, backups, and deployments.
Consistency: Ensure that tasks are performed consistently every time.
Efficiency: Save time and effort by automating manual tasks.
Features
Steps of the fetch_logs.sh Script:
1️⃣ Fetch Pod Names: Retrieves the names of all pods in the Kubernetes namespace.

2️⃣ Fetch Logs: Iterates through each pod and fetches its logs if the pod has a single container.

3️⃣ Create Directories: Creates directories to store the fetched logs and zip files.

4️⃣ Fetch Logs for Each Container: Fetches logs for each container within the pod and stores them in separate files.

5️⃣ Create tar.gz File: Creates a tar.gz file containing all the fetched logs.

6️⃣ Copy Zip File to Local Machine: Copies the zip file containing the logs to a local directory on your machine.

Usage
To use the fetch_logs.sh script:

Clone the repository:
bash
Copy code
git clone https://github.com/HarnilShah1602/fetch_logs_pod.git
Make the script executable:
bash
Copy code
chmod +x fetch_logs.sh
Run the script:
bash
Copy code
./fetch_logs.sh
Example
You can add a cronjob to schedule the time to run this script when you want:

bash
Copy code
# Run the script every day at 2:00 AM
0 2 * * * /path/to/fetch_logs.sh
Contributing
Feel free to contribute to this project! Fork the repository, make your changes, and submit a pull request.

Feedback
Your feedback is highly appreciated! If you have any suggestions or find any issues, please create an issue in the GitHub repository.