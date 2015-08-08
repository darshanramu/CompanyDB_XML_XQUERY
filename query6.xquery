xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query6>
{
let $xmlfile:=doc("company.xml")/XYZ_COMPANY

return distinct-values	(for $empl in $xmlfile/Employee
								where $empl/empID = (for $e in distinct-values($xmlfile/Employee/empID)
																where count($xmlfile/WorksFor[empID=$e])=(max(for $emp in distinct-values($xmlfile/Employee/empID) return count($xmlfile/WorksFor[empID=$emp])))
																return $e)
return ($empl/empName,$empl/empPhone,$empl/empOffice))
}
</query6>