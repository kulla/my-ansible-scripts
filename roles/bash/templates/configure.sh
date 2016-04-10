for FILE in $( find "{{ shell_conf_dir }}/{{ item.name }}/" -type f ); do
	source $FILE
done
