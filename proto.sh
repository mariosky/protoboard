source venv/bin/activate
if ! tmux has-session -t proto; then 
	tmux new -s proto -d
	tmux new-window -t proto:1 
	tmux split-window -t proto:1 -h 
	tmux send-keys -t proto:1.0 "cd docker_compose/sandbox" Enter
	tmux send-keys -t proto:1.0 "docker compose up" Enter
	tmux split-window -t proto:1.0 -v 
	tmux send-keys -t proto:1.1 "tailwindcss -i input.css -o ./activitytree/static/assets/css/style.css --watch" Enter
	tmux send-keys -t proto:1.2 "python3 manage.py runserver 0.0.0.0:8000" Enter
	tmux send-keys -t proto:0 "nvim ." Enter

fi
	tmux attach -t proto
