KEY_DIR=~/Dropbox/SSH\ Keys

# Check if keys are available
[ -e "$KEY_DIR" ] || exit 1

WD=$(pwd)

keys=$(ls "$KEY_DIR" | grep enc$)
for k in $keys
do

	# Skip if key exists
	[ -e ~/.ssh/${k%.enc} ] && continue

	# Copy key and decrypt
	cp "$KEY_DIR/$k" ~/.ssh/ && cd ~/.ssh && decrypt $k
done

# Clean up
rm -rf ~/.ssh/*.enc

cd $WD