xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query4>
{
let $xmlfile:=doc("company.xml")/XYZ_COMPANY

for $e in $xmlfile/Employee
where $e/empID=(distinct-values(((for $emp in $xmlfile/Employee return $emp/empID))[not(.= ((for $div in $xmlfile/Division return $div/managerEmpID)))]))
return (distinct-values($e/empName),distinct-values($e/empPhone),distinct-values($e/empOffice))
}
</query4>
