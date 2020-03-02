FROM node:lts-alpine

WORKDIR /usr/src/app

# Cannot install in current directory, create a `webapp` directory instead...
RUN npx create-react-app webapp --template typescript
# and move its content in WORKDIR
RUN mv webapp/* .
RUN mv webapp/.gitignore .
# Install work dependencies
RUN npm install -s styled-components react-router-dom redux react-redux redux-saga axios
# Install types definitions
RUN npm install -D @types/styled-components @types/react-redux @types/react-router-dom

EXPOSE 3000
CMD [ "npm", "run", "start" ]
