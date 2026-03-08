# Use the official Jekyll image as a base
FROM jekyll/jekyll:latest

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Copy the site source code into the container.
# The `.` at the end means "copy everything from the current host directory".
COPY . /srv/jekyll

# Expose the default Jekyll port (4000)
EXPOSE 4000

# Set the default command to run the Jekyll server
# The --host 0.0.0.0 makes it accessible from the host machine
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]
