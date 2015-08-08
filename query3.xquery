xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query3>
{
let $xmlfile:=doc("company.xml")/XYZ_COMPANY

for $dept in $xmlfile/Department
where $dept/deptID = (for $div in $xmlfile/Division
								where  $div/managerEmpID = (for $emp in $xmlfile/Employee 
																			where $emp/empName="PSmith" return $emp/empID) 
																			and 
																			$div/housedDeptID != (for $div in $xmlfile/Division 
																											where  $div/managerEmpID = (for $emp in $xmlfile/Employee 
																																						where $emp/empName="Wong" return $emp/empID) 
																											return distinct-values($div/housedDeptID))
								return distinct-values($div/housedDeptID))
return distinct-values($dept/deptName)
}
</query3>
