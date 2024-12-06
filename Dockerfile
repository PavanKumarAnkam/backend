# Use official Node.js image
FROM node:20

# Expose the application port
EXPOSE 8080

# Set environment variables
ENV DB_HOST=mysql

# Create a new user and set permissions
RUN useradd -m expense
RUN mkdir /opt/server && chown -R expense:expense /opt/server

# Set the working directory
WORKDIR /opt/server

# Copy only the package.json first for better caching of npm install
COPY ./package.json /opt/server

# Install dependencies
RUN npm install

# Copy all application files
COPY . /opt/server

# Set the user to the 'expense' user
USER expense

# Run the application
CMD [ "node", "index.js" ]


# FROM node:20
# EXPOSE 8080
# ENV DB_HOST=mysql
# RUN useradd expense
# RUN mkdir /opt/server
# RUN chown expense:expense -R /opt/server
# WORKDIR /opt/server
# COPY ./package.json /opt/server
# COPY ./*.js /opt/server
# RUN npm install
# CMD [ "node","index.js" ]
    