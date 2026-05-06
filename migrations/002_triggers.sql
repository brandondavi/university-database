-- trigger
-- prevents negative value on salary
CREATE OR REPLACE FUNCTION check_salary_positive()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION 'Salary cannot be negative';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Bind the function to the Payroll table
CREATE TRIGGER "PreventNegativeSalary"
BEFORE INSERT OR UPDATE ON "Payroll"
FOR EACH ROW
EXECUTE FUNCTION check_salary_positive();