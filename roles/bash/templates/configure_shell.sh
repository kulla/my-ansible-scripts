for FILE in $( find "{{ shell_rc_dir }}" -type f ); do
	source $FILE
done

if [ -n "$BASH_VERSION" ]; then
	for FILE in $( find "{{ bash_rc_dir }}" -type f ); do
		source $FILE
	done
fi
