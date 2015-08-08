xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";


<query1>
{
let $xmlfile:=doc("company.xml")/XYZ_COMPANY
for $dept in $xmlfile/Department
where $dept/deptID = (for $div in $xmlfile/Division
								where $div/divID = (for $wf in $xmlfile/WorksFor
															where $wf/empID = (for $emp in $xmlfile/Employee 
																						where $emp/empName="Jack" or $emp/empName="PSmith" 
																						return $emp/empID) and $wf/percentTime>=50
															return $wf/divID)
								return $div/housedDeptID)
return distinct-values($dept/deptName)
}
</query1>

