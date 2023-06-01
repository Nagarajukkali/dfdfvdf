# Tried to get it working with nvm, but would need to install a lot of dependencies which would blow out the size of the
# final image for no reason.  Decided to just specify the same version of node as specified in the .nvmrc file
FROM node:lts-alpine

### Copy code to /src
COPY . /src
WORKDIR /src

# Install dependencies needed for npm install
RUN apk add -U curl bash ca-certificates openssl; \
# Make localhost point to the docker bridge network so that it can communicate with self-service backend
echo "cat /etc/hosts | sed -E \"s/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\s+localhost/\$(route -n | awk '/UG[ \t]/{print \$2}') localhost/\" > /etc/hosts" > ~/.profile; \
## Need to run this in bash for npm to install shine dependency correctly because of postinstall script
/bin/bash -c "npm install --force"

# click-to-pay
EXPOSE 4302

# Use exec version of entrypoint/cmd because of format weirdness
# More here: https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["npm start"]
