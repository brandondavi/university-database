# University Database — SQL Migrations 

A fully-relational university database schema built for **PostgreSQL / Supabase**. It tracks users, agents, support tickets, SLA policies, assignment history, and comments. --- 

## Run Order | File | Purpose | |------|---------| | [001_init.sql](001_init.sql) | Create all tables, constraints, and indexes | | [002_triggers.sql](002_triggers.sql) | Add triggers for automation & business rules (currently only 1) | | [003_seed_data.sql](003_seed_data.sql) | Insert sample/seed data | | [004_views.sql](004_views.sql) | Create a dashboard view & more (Currently only 1) | | [005_queries.sql](005_queries.sql) | Example SELECT / UPDATE / DELETE queries | > Proposal is in [Docs/](Docs/). --- 


## Entity-Relationship Diagram
mermaid
erDiagram
  STUDENTS ||--o{ ENROLLMENTS : enrolls
  COURSES ||--o{ SECTIONS : contains
  SECTIONS ||--o{ ENROLLMENTS : "has"
  DEPARTMENTS ||--o{ COURSES : offers
  DEPARTMENTS ||--o{ INSTRUCTORS : employs
  INSTRUCTORS ||--|| DEPARTMENTS : heads
  INSTRUCTORS ||--o{ SECTIONS : teaches
  COURSELEVELS ||--o{ COURSES : classifies
  SECTIONSTATUS ||--o{ SECTIONS : marks
  STAFF ||--|| PAYROLL : receives

  STUDENTS {
    int id PK
    varchar firstName
    varchar lastName
    varchar email UK
  }

  COURSES {
    int id PK
    varchar courseNumber
    varchar courseName
    int departmentID FK
    int levelID FK
  }

  SECTIONS {
    int id PK
    varchar sectionNumber
    varchar semester
    int year
    int courseID FK
    int instructorID FK
    int statusID FK
  }

  DEPARTMENTS {
    int id PK
    varchar departmentName
    int headOfDepartmentID FK
  }

  INSTRUCTORS {
    int id PK
    varchar firstName
    varchar lastName
    date startDate
    int departmentID FK
  }

  STAFF {
    int id PK
    varchar firstName
    varchar lastName
    date startDate
    varchar role
  }

  ENROLLMENTS {
    int id PK
    int studentID FK
    int sectionID FK
    date enrollmentDate
  }

  PAYROLL {
    int id PK
    decimal salary
    varchar payPeriod
  }

  COURSELEVELS {
    int id PK
    varchar levelName
  }

  SECTIONSTATUS {
    int id PK
    varchar statusName
  }
---

## Triggers (`002_triggers.sql`)

| Trigger | Table | Event | What it does |
|---------|-------|-------|--------------|
| `trg_ticket_updated_at` | `ticket` | `BEFORE UPDATE` | Stamps `updated_at = NOW()` automatically |

---

## Views (`004_views.sql`)

| View | Description |
|------|-------------|
| `CourseSection` | All courses and their department are listed |

---


## Docs

Extended documentation lives in [`docs/`](docs/):

| File | Contents |
|------|---------|
| `docs/proposal.md` | Schema documentation |

