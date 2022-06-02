const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

const input = process.argv[2];

pool
  .query(
    `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
      FROM teachers
      JOIN assistance_requests ON teachers.id = teacher_id
      JOIN students ON students.id = student_id
      JOIN cohortS ON cohorts.id = cohort_id
      WHERE cohorts.name = $1 
      ORDER BY teachers.name;`,
    [input]
  )
  .then((res) => {
    console.log("connected");
    res.rows.forEach((data) => {
      console.log(`${data.cohort} : ${data.teacher}`);
    });
  })
  .catch((err) => console.error("query error", err.stack));
