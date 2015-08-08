<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="html"/>
		<xsl:template match="/">
		<html>
			<body>
				<div style="background-color:yellow;color:red;font-size:24px;font-weight:bold;font-family:Arial">
				 Employee Information	
				</div>
				<div style="font-size:12px;font-family:Arial">
				<xsl:for-each select="/XYZ_COMPANY/Employee">
					<xsl:variable name="employeeId" select="empID" />
					<br />
				Employee  
				<b><xsl:value-of select="empName"/></b>
				 works from
				<b><xsl:value-of select="empOffice"/></b> office. 
				<b><xsl:value-of select="empName"/></b> works for  
				<b><xsl:value-of select="count(/XYZ_COMPANY/WorksFor[empID=$employeeId])"/></b>
				 division(s), which are
				<b><xsl:for-each select="/XYZ_COMPANY/WorksFor[empID=$employeeId]">
							<xsl:variable name="divisionId" select="divID" />
								<xsl:choose>
									<xsl:when test="position() = last()">
										and	<xsl:value-of select="/XYZ_COMPANY/Division[divID=$divisionId]/divName"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/XYZ_COMPANY/Division[divID=$divisionId]/divName"/>
											<xsl:if test="not(position()=last()-1)">
												<xsl:text>, </xsl:text>
											</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
						</xsl:for-each>.</b>
				<b><xsl:value-of select="empName"/></b>
				 manages 
				<b><xsl:value-of select="count(/XYZ_COMPANY/Division[managerEmpID=$employeeId])"/></b>
				 division(s)
								<xsl:choose>
									<xsl:when test="count(/XYZ_COMPANY/Division[managerEmpID=$employeeId])>1">
													, which are <b>
													<xsl:for-each select="/XYZ_COMPANY/Division[managerEmpID=$employeeId]">
															<xsl:choose>
																<xsl:when test="position() = last()">
																	and	<xsl:value-of select="divName"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="divName"/>
																	<xsl:if test="not(position()=last()-1)">
																		<xsl:text>, </xsl:text>
																	</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
													</xsl:for-each>
												</b> 	
									</xsl:when>
									<xsl:when test="count(/XYZ_COMPANY/Division[managerEmpID=$employeeId])=1">
													, which is <b>
													<xsl:for-each select="/XYZ_COMPANY/Division[managerEmpID=$employeeId]">
																	<xsl:value-of select="divName"/>
													</xsl:for-each>
												</b> 	
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>.
					<b><xsl:value-of select="empName"/></b>
					works for the most time with the <b>
						<xsl:for-each select="/XYZ_COMPANY/WorksFor[empID=$employeeId]">
							<xsl:sort data-type="number" order="descending" select="percentTime"/>
							<xsl:if test="position()=1">
								<xsl:variable name="divisionId" select="divID" />
								<xsl:value-of select="/XYZ_COMPANY/Division[divID=$divisionId]/divName"/>
							</xsl:if>
						</xsl:for-each>
					</b> division.<br/>
					</xsl:for-each>
				</div>
				<br />
				<div style="background-color:lightgreen;color:red;font-size:24px;font-weight:bold;font-family:Arial">
				Department Information	
				</div>
				<div style="font-size:12px;font-family:Arial">
					<xsl:for-each select="/XYZ_COMPANY/Department">
				<br />
						Department
						<b><xsl:value-of select="deptName"/></b>
						houses 
						<xsl:variable name="departmentId" select="deptID" />
						<b><xsl:value-of select="count(/XYZ_COMPANY/Division[housedDeptID=$departmentId])"/></b>
						 division(s): 
						<b>									
						<xsl:for-each select="/XYZ_COMPANY/Division[housedDeptID=$departmentId]">
							<xsl:choose>
									<xsl:when test="position() = last()">
										and	<xsl:value-of select="divName"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="divName"/>
											<xsl:if test="not(position()=last()-1)">
												<xsl:text>, </xsl:text>
											</xsl:if>
									</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>.
					</b>
					<br />
					</xsl:for-each>
		</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
