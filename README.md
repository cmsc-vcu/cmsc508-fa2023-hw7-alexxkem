# Homework 7 CMSC508 Fall 2023

## Overview
This project involves creating and managing a database that stores detailed information about people, their skills, and their roles within an organization. It includes tables for `people`, `skills`, `roles`, `peopleskills`, and `peopleroles`, providing a comprehensive view of the relationships between individuals, their abilities, and their positions.

## Features
- **People Information**: Tracks personal details like names, emails, LinkedIn profiles, headshots, Discord handles, brief bios, and joining dates.
- **Skills Catalog**: Lists various skills with descriptions, tags, external URLs, and the time commitment required to acquire them.
- **Roles Hierarchy**: Defines different roles within the organization along with their sort priorities.
- **Skills Assignment**: Connects people to their respective skills and tracks when these skills were acquired.
- **Roles Assignment**: Associates people with their roles and records the date of role assignment.

## Database Schema
The database schema includes the following tables:
1. `people`: Contains personal information about individuals.
2. `skills`: Catalogs skills available within the organization.
3. `roles`: Lists roles and their importance in the organizational structure.
4. `peopleskills`: Junction table linking people with their skills.
5. `peopleroles`: Junction table associating people with their roles.

## Installation and Setup
To set up the database:
1. Ensure MySQL or a compatible database system is installed.
2. Execute the SQL scripts provided in `schema.sql` to create the tables.
3. Populate the tables with initial data using `data.sql`.

## Usage
The database can be queried to extract various insights, such as:
- The skills possessed by each individual.
- The roles assigned to each person in the organization.
- Skill details, including their descriptions and required time commitments.

Sample queries are provided in `queries.sql`.

## Reflections
Working on this project provided valuable insights into database creation and data retrieval processes. It was both challenging and rewarding, offering a practical application of the concepts learned in class.



