-- 系所表：存放系所代碼、名稱及辦公室地點
CREATE TABLE Department (
  DeptCode VARCHAR(10) PRIMARY KEY,
  DeptName VARCHAR(100),
  OfficeLocation VARCHAR(100)
);

-- 學生表：紀錄學生資訊及主修系所
CREATE TABLE Student (
  StudentID VARCHAR(20) PRIMARY KEY,
  StudentName VARCHAR(100),
  MajorDeptCode VARCHAR(10),
  FOREIGN KEY (MajorDeptCode) REFERENCES Department(DeptCode)
);

-- 課程表：紀錄課程基本資料與所屬系所
CREATE TABLE Course (
  CourseCode VARCHAR(20) PRIMARY KEY,
  CourseName VARCHAR(100),
  Credits INT,
  DeptCode VARCHAR(10),
  FOREIGN KEY (DeptCode) REFERENCES Department(DeptCode)
);

-- 講師表：紀錄講師資訊及所屬系所、辦公室位置
CREATE TABLE Instructor (
  InstructorID VARCHAR(20) PRIMARY KEY,
  InstructorName VARCHAR(100),
  DeptCode VARCHAR(10),
  OfficeNumber VARCHAR(50),
  FOREIGN KEY (DeptCode) REFERENCES Department(DeptCode)
);

-- 課程開課表：記錄課程、學期及授課講師，複合主鍵
CREATE TABLE CourseOffering (
  CourseCode VARCHAR(20),
  Semester VARCHAR(20),
  InstructorID VARCHAR(20),
  PRIMARY KEY (CourseCode, Semester, InstructorID),
  FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
  FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- 選課紀錄表：紀錄學生選課資訊及成績，複合主鍵
CREATE TABLE Enrollment (
  StudentID VARCHAR(20),
  CourseCode VARCHAR(20),
  Semester VARCHAR(20),
  InstructorID VARCHAR(20),
  Grade VARCHAR(5),
  PRIMARY KEY (StudentID, CourseCode, Semester, InstructorID),
  FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  FOREIGN KEY (CourseCode, Semester, InstructorID) REFERENCES CourseOffering(CourseCode, Semester, InstructorID)
);
