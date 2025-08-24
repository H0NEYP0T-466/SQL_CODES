# Contributing to SQL_CODES

First off, thank you for considering contributing to SQL_CODES! 🎉 It's people like you that make SQL_CODES such a great learning resource for the database community.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Code Style Guidelines](#code-style-guidelines)
- [Submitting Changes](#submitting-changes)
- [Bug Reports](#bug-reports)
- [Feature Requests](#feature-requests)
- [Testing Guidelines](#testing-guidelines)
- [Documentation Updates](#documentation-updates)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our commitment to creating a welcoming and inclusive environment. By participating, you are expected to uphold these standards:

- **Be respectful** and inclusive in your language and actions
- **Be collaborative** and help others learn
- **Be constructive** in your feedback and suggestions
- **Focus on what is best** for the community and learning objectives

## 🤝 How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When creating a bug report, include:

- **Clear description** of the problem
- **SQL script name** where the issue occurs
- **Database system** and version you're using
- **Expected vs actual behavior**
- **Steps to reproduce** the issue
- **Error messages** (if any)

### 💡 Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description** of the suggested enhancement
- **Explain why this enhancement would be useful** to SQL learners
- **Include examples** of how it would work

### 📝 Contributing Code

We welcome contributions of:
- **New SQL scripts** and learning exercises
- **Improvements** to existing scripts
- **Additional database examples** (different domains/industries)
- **Performance optimizations**
- **Documentation improvements**

## 🚀 Getting Started

### 1. Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/your-username/SQL_CODES.git
   cd SQL_CODES
   ```

### 2. Create a Branch

Create a new branch for your contribution:
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

### 3. Set Up Your Environment

- Install Microsoft SQL Server or SQL Server Express
- Use SQL Server Management Studio (SSMS) or Azure Data Studio
- Test your SQL scripts before submitting

## 📏 Code Style Guidelines

### SQL Code Standards

#### Naming Conventions
```sql
-- Use descriptive, lowercase names with underscores
CREATE TABLE patient_records (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

-- Use consistent prefixes for related objects
CREATE PROCEDURE sp_GetPatientInfo
CREATE FUNCTION fn_CalculateAge
CREATE VIEW vw_ActivePatients
```

#### Formatting Guidelines
```sql
-- Use uppercase for SQL keywords
SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_date >= '2024-01-01'
ORDER BY p.last_name, p.first_name;

-- Indent subqueries and complex statements
SELECT *
FROM patients
WHERE patient_id IN (
    SELECT DISTINCT patient_id
    FROM appointments
    WHERE appointment_date > GETDATE()
);
```

#### Comments and Documentation
```sql
-- Single-line comments for brief explanations
/* 
   Multi-line comments for detailed explanations
   of complex logic or business rules
*/

-- Header comment for each script
/*
===============================================
Script Name: patient_management.sql
Purpose: Demonstrates patient record management
Author: Your Name
Date: YYYY-MM-DD
Database: SQL Server 2019+
===============================================
*/
```

### File Organization

- **File naming**: Use descriptive names with proper extensions
- **Script structure**: Include clear sections with comments
- **Dependencies**: Note any required scripts or setup steps
- **Sample data**: Include realistic test data when appropriate

## 📤 Submitting Changes

### Pull Request Process

1. **Update documentation** if you're adding new features
2. **Test your SQL scripts** thoroughly
3. **Include sample data** for new examples when relevant
4. **Write clear commit messages**:
   ```
   Add hospital inventory management example
   
   - Creates tables for medical equipment tracking
   - Includes stored procedures for inventory updates
   - Adds sample data for demonstration
   ```

5. **Create a pull request** with:
   - Clear title describing the change
   - Detailed description of what you've added/changed
   - Reference to any related issues
   - Screenshots or query results if applicable

### Pull Request Template

When creating a PR, please include:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature/script
- [ ] Documentation update
- [ ] Performance improvement

## Testing
- [ ] Scripts execute without errors
- [ ] Sample data loads correctly
- [ ] Results match expected output

## Checklist
- [ ] Code follows style guidelines
- [ ] Comments are clear and helpful
- [ ] Documentation updated if needed
```

## 🐞 Bug Reports

### Before Submitting

1. **Check existing issues** for similar problems
2. **Test with latest version** of the repository
3. **Verify SQL syntax** using your database system

### Bug Report Template

```markdown
**Describe the bug**
A clear description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Open script '...'
2. Execute query '...'
3. See error

**Expected behavior**
What you expected to happen.

**Environment:**
- Database: [e.g., SQL Server 2019]
- Tool: [e.g., SSMS 18.0]
- OS: [e.g., Windows 10]

**Additional context**
Add any other context about the problem.
```

## 💭 Feature Requests

We welcome suggestions for new learning content! Consider:

- **Educational value**: Will this help others learn SQL?
- **Practical application**: Does this solve real-world problems?
- **Complexity level**: Is it appropriate for the target audience?
- **Database compatibility**: Does it work with common SQL databases?

## 🧪 Testing Guidelines

### Before Submitting

1. **Execute all scripts** in a clean database environment
2. **Verify sample data** loads without errors
3. **Test edge cases** and error conditions
4. **Check performance** with larger datasets when relevant

### Test Checklist

- [ ] Scripts execute without syntax errors
- [ ] Sample data inserts successfully
- [ ] Queries return expected results
- [ ] No orphaned objects left after execution
- [ ] Comments accurately describe functionality

## 📚 Documentation Updates

### What to Document

- **New SQL concepts** introduced in scripts
- **Prerequisites** for running scripts
- **Expected outcomes** and learning objectives
- **Real-world applications** of demonstrated techniques

### Documentation Standards

- Use clear, beginner-friendly language
- Include code examples with explanations
- Provide context for business scenarios
- Update README.md for major additions

## 🔄 Review Process

1. **Automated checks** will verify basic standards
2. **Maintainer review** for code quality and educational value
3. **Community feedback** welcome on all contributions
4. **Merge** after approval and any requested changes

## 🆘 Getting Help

- **Issues**: Create an issue for questions or problems
- **Discussions**: Use GitHub Discussions for general questions
- **Email**: Contact repository maintainers for sensitive issues

## 🎯 Recognition

Contributors will be:
- **Acknowledged** in the repository
- **Added** to the contributors list
- **Credited** for significant contributions

---

Thank you for contributing to SQL_CODES! Your efforts help make database learning accessible to everyone. 🙏

**Happy coding!** 🚀