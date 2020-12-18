# read in the html file into a vector, one line of the file per element
chae <- readLines("CASchaetostoma.html", encoding = "UTF-8")
# pick all lines that include the sentenc "Valid as:"
chae <- grep("Current status:</b> Valid", x = chae, value = TRUE)
# check the length of such element
length(chae)
# remove all multiple spaces
chae <- gsub(pattern = "\\s+", replacement = " ", x = chae)
# Remove the sentence "Current status: Valid as " with its respective html format
chae <- gsub(pattern = "^.+<b>Current status:</b> Valid as ", replacement = "", x = chae, ignore.case = TRUE)
# check the results
print(chae)
# Strip everything from "Loricariidae. " to the end of line
chae <- gsub(pattern = " Loricariidae.+$", replacement = "", x = chae)
# check results
print(chae)
# remove the html tags for italics
chae <- gsub(pattern = "<[i/]+>", "", chae)
# remove periods
chae <- gsub(pattern = "\\.", replacement = "", chae)
# remove names of the vector elements
chae <- unname(chae)
# pick only those elements with the name Chaetostoma, which include the species names
chaeFinal <- grep(x = chae, pattern = "Chaetostoma ", value = TRUE)
# print the final result
print(chaeFinal)
