#==============================================================================
#
# Created by Darienne Hallas
# 2017-10-11
#
#==============================================================================



#==============================================================================
#
# The purpose of this script is to design a class that characterises the design
# of the longitudal dataset, as well as classes for "subject", "visit" and
# "room". Functions as well as methods also need to be created.
#
#==============================================================================



#======================== LOAD LIBRARIES ======================================
if(!("pacman" %in% installed.packages())) {
    install.packages("pacman")
}

library(pacman)

p_load(readr)
p_load(magrittr)
p_load(rprojroot)



# set the working directory to the project folder
root_folder <- find_root(is_rstudio_project)



LongitudinalData <- setRefClass("LongitudinalData",
                                fields = list(ID = "numeric",
                                              visit = "numeric",
                                              room = "character",
                                              value = "numeric",
                                              timepoint = "numeric"),
                                methods = list(
                                    make_LD = function(dataSet) {
                                        #convert the dataframe input into the LD class
                                    },
                                    subject = function(record, subjectID) {
                                        # check if there is an ID equal to subjectID
                                        # print NULL if not and "Subject ID: "&subjectID
                                    },
                                ))



# describe function
setGeneric("subject",
           function(record, subjectID) {
               standardGeneric("subject")
           }
)

setMethod("subject",
          c(record = LongitudinalData,
            subjectID = "numeric"),
          function(record, subjectID) {
              # check if there is an ID equal to subjectID
              # print NULL if not and "Subject ID: "&subjectID
          }
)



# describe function
setGeneric("visit",
           function(subjectID, visitNum) {
               standardGeneric("visit")
           }
)

setMethod("visit",
          c(subjectID = "numeric",
            visitNum = "numeric"),
          function(subjectID, visitNum) {
              # return subject ID and visit num
              print(paste0("ID: ", subjectID, "\n", "Visit: ", visitNum))
          }
)



# describe function
setGeneric("room",
           function(subjectID, visitNum, roomType) {
               standardGeneric("room")
           }
)

setMethod("room",
          c(subjectID = "numeric",
            visitNum = "numeric",
            roomType = "character"),
          function(subjectID, visitNum, roomType) {
              # return subject ID, visit num and room
              print(paste0("ID: ", subjectID, "\n", "Visit: ", visitNum, "\n", "Room: ", roomType))
          }
)