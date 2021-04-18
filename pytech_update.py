""" import statements """
from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.hrvpi.mongodb.net/pytech?retryWrites=true&w=majority"

# connect to the MongoDB cluster 
client = MongoClient(url)

# connect pytech database
db = client.pytech

# get the students collection 
students = db.students

# find all students in the collection 
student_list = students.find({})
# display message 
print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
in1 = students.find_one({"student_id": "1007"})
print("  Student ID: " + in1["student_id"] + "\n  First Name: " + in1["first_name"] + "\n  Last Name: " + in1["last_name"] + "\n")
in2 = students.find_one({"student_id": "1008"})
print("  Student ID: " + in2["student_id"] + "\n  First Name: " + in2["first_name"] + "\n  Last Name: " + in2["last_name"] + "\n")
in3 = students.find_one({"student_id": "1009"})
print("  Student ID: " + in3["student_id"] + "\n  First Name: " + in3["first_name"] + "\n  Last Name: " + in3["last_name"] + "\n")
# loop over the collection and output the results 
#for doc in new_student_list:
    #print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")
# update student_id 1007
result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Oakenshield II"}})

# find the updated student document 
in1 = students.find_one({"student_id": "1007"})

# display message
print("\n  -- DISPLAYING STUDENT DOCUMENT 1007 --")

# output the updated document to the terminal window
print("  Student ID: " + in1["student_id"] + "\n  First Name: " + in1["first_name"] + "\n  Last Name: " + in1["last_name"] + "\n")
# exit message 
input("\n\n  End of program, press any key to continue...")