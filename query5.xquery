xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

<query5>
{
let $xmlfile:=doc("company.xml")/XYZ_COMPANY

return avg(for $emp in distinct-values($xmlfile/Employee/empID) return count($xmlfile/WorksFor[empID=$emp])) 
}
</query5>

