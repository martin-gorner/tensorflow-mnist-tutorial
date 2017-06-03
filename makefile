# url: http://stackoverflow.com/questions/5193648/automatic-generate-target-from-source-list-make-file

%: %.py
	@./docker/run.sh bash -c "cd sources; python3 ${^}"
