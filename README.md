# SQL_CODES

![GitHub License](https://img.shields.io/github/license/H0NEYP0T-466/SQL_CODES?style=for-the-badge&color=brightgreen)
![GitHub Stars](https://img.shields.io/github/stars/H0NEYP0T-466/SQL_CODES?style=for-the-badge&color=yellow)
![GitHub Forks](https://img.shields.io/github/forks/H0NEYP0T-466/SQL_CODES?style=for-the-badge&color=blue)
![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/H0NEYP0T-466/SQL_CODES?style=for-the-badge&color=red)

A comprehensive collection of SQL scripts, database projects, and learning exercises covering essential database concepts, advanced queries, and real-world applications. Perfect for students, developers, and database enthusiasts looking to master SQL and database management systems.

## 🔗 Links

- [📖 Documentation](#-table-of-contents)
- [🐛 Issues](https://github.com/H0NEYP0T-466/SQL_CODES/issues)
- [🤝 Contributing](#-contributing)

## 📋 Table of Contents

- [🚀 Installation](#-installation)
- [💻 Usage](#-usage)
- [✨ Features](#-features)
- [📁 Project Structure](#-project-structure)
- [🛠️ Built With](#️-built-with)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🗺️ Roadmap](#️-roadmap)
- [🙏 Acknowledgments](#-acknowledgments)

## 🚀 Installation

### Prerequisites

Before running these SQL scripts, ensure you have one of the following database management systems installed:

- **Microsoft SQL Server** (Recommended)
- **SQL Server Management Studio (SSMS)**
- **Azure Data Studio**
- **Visual Studio Code** with SQL Server extension

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/H0NEYP0T-466/SQL_CODES.git
   cd SQL_CODES
   ```

2. **Set up your database environment**
   - Install Microsoft SQL Server or use SQL Server Express
   - Open SQL Server Management Studio (SSMS)

3. **Connect to your SQL Server instance**
   - Use Windows Authentication or SQL Server Authentication
   - Ensure you have appropriate permissions to create databases

4. **Run the scripts**
   - Open any `.sql` file in SSMS
   - Execute the scripts step by step or all at once

## 💻 Usage

### Basic Database Operations

```sql
-- Create a new database
CREATE DATABASE YourDatabaseName;
USE YourDatabaseName;

-- Run any script from the repository
-- Example: Hospital Management System
-- Open and execute 'sql project.sql'
```

### Lab Activities

The repository contains numbered lab activities that should be completed in sequence:

```sql
-- Start with lab_activity#1.sql for basic concepts
-- Progress through lab_activity#2.sql to lab_activity#8.sql
-- Each lab builds upon previous concepts
```

### Example Projects

1. **Hospital Management System** (`sql project.sql`)
   - Complete database schema for healthcare management
   - Includes patients, doctors, nurses, treatments, and billing

2. **Company Database** (`A1Sql_CompanyDB.sql`)
   - Employee management system
   - Department and salary tracking

3. **E-commerce Database** (`A2_Ecommerence.sql`)
   - Customer and product management
   - Order processing system

## ✨ Features

- 🏥 **Hospital Management System** - Complete healthcare database with patient records, staff management, and billing
- 🏢 **Company Database Examples** - Employee management and departmental structures
- 🛒 **E-commerce Solutions** - Customer, product, and order management systems
- 📚 **Progressive Lab Activities** - Step-by-step learning exercises from basic to advanced SQL
- 🔧 **Database Constraints** - Examples of primary keys, foreign keys, check constraints, and unique constraints
- 🔄 **Transactions & Functions** - Advanced SQL features including stored procedures and user-defined functions
- 📊 **Data Manipulation** - Comprehensive CRUD operations and complex queries
- 🎯 **Real-world Scenarios** - Practical database design patterns and best practices

## 📁 Project Structure

```
SQL_CODES/
├── 📄 README.md                    # Project documentation
├── 📄 LICENSE                      # MIT License
├── 📄 CONTRIBUTING.md              # Contribution guidelines
├── 🏥 sql project.sql              # Hospital Management System (Main Project)
├── 🏢 A1Sql_CompanyDB.sql          # Company Database Example
├── 🛒 A2_Ecommerence.sql           # E-commerce Database Example
├── 🔧 Constraints.sql              # Database Constraints Examples
├── 🗃️ Create&DeleteDB.sql          # Database Creation & Deletion
├── 📝 SQL_DDL_Commands.sql         # Data Definition Language Examples
├── 📚 lab_activity#1.sql           # Basic SQL Operations
├── 📚 lab_activity#2.sql           # Intermediate Queries
├── 📚 lab_activity#3.sql           # Advanced Joins
├── 📚 lab_activity#4.sql           # Subqueries & Views
├── 📚 lab_activity#5.sql           # Transactions & Error Handling
├── 📚 lab_activity#6.sql           # Stored Procedures
└── 📚 lab_activity#8.sql           # Functions & Advanced Features
```

## 🛠️ Built With

- **[Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server)** - Primary database management system
- **[T-SQL](https://docs.microsoft.com/en-us/sql/t-sql)** - Transact-SQL language for advanced features
- **[SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms)** - Database administration tool
- **[Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio)** - Cross-platform database tool
- **SQL** - Standard Query Language for database operations

## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

### Quick Start for Contributors

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🗺️ Roadmap

### Current Features ✅
- [x] Hospital Management System with complete schema
- [x] Progressive lab activities covering SQL fundamentals
- [x] Real-world database examples (Company, E-commerce)
- [x] Advanced SQL features (Functions, Procedures, Transactions)
- [x] Database constraints and relationships

### Planned Features 🚀
- [ ] **NoSQL Database Examples** - MongoDB and other NoSQL implementations
- [ ] **Performance Optimization** - Query optimization techniques and indexing strategies
- [ ] **Data Warehousing** - OLAP and dimensional modeling examples
- [ ] **Integration Examples** - API integration and data migration scripts
- [ ] **Security Features** - User management, roles, and permissions
- [ ] **Backup & Recovery** - Database maintenance and disaster recovery scripts

### Future Vision 🌟
- [ ] **Interactive Tutorials** - Web-based SQL learning platform
- [ ] **Video Content** - Comprehensive video explanations for each lab
- [ ] **Practice Problems** - Additional exercises with solutions
- [ ] **Certification Prep** - Materials for SQL certification exams
- [ ] **Multi-DBMS Support** - Examples for PostgreSQL, MySQL, Oracle

## 🙏 Acknowledgments

- **Microsoft** for providing excellent SQL Server documentation and tools
- **Stack Overflow Community** for continuous learning and problem-solving
- **SQL learning community** for inspiration and best practices
- **Database design experts** whose patterns and practices are demonstrated here
- **Open source contributors** who make knowledge sharing possible

### Tech Stack & Tools
- 🗄️ **Database Systems**: SQL Server, T-SQL
- 🛠️ **Development Tools**: SQL Server Management Studio, Azure Data Studio
- 📊 **Data Modeling**: Relational database design principles
- 🔄 **Version Control**: Git, GitHub
- 📝 **Documentation**: Markdown, GitHub Pages

---

<div align="center">

**Made with ❤️ by [H0NEYP0T-466](https://github.com/H0NEYP0T-466)**

⭐ Star this repository if you found it helpful!

</div>