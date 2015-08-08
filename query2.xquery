xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query2>
{
let $xmlfile:=doc("company.xml")/XYZ_COMPANY

for $div in $xmlfile/Division
where $div/divID = (for $d in distinct-values($xmlfile/WorksFor/divID)
							where count($xmlfile/WorksFor[divID=$d]) = count(for $emp in $xmlfile/Employee/empID return count($emp))
							return $d)
return distinct-values($div/divName)
}
</query2>