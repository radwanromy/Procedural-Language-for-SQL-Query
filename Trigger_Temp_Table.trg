CREATE TABLE t_emp_table(
user_name varchar(255) NOT NULL,
                             timestampn varchar(255) NOT NULL,
                             idn  int NOT NULL,
                             old_last_name varchar(255) NOT NULL,
                             new_last_name varchar(255) NOT NULL,
                             old_title varchar(255) NOT NULL,
                             new_title varchar(255) NOT NULL,
                             old_salary varchar(255) NOT NULL,
                             new_salary varchar(255) NOT NULL,
                             operation varchar(255) NOT NULL,
    PRIMARY KEY (IDN)
);