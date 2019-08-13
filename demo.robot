*** Settings ***
Documentation    Example Suite
Library    OperatingSystem
Library    Collections
Resource    resources/demo_resources.resource

*** Variables ***
${MESSAGE}    Hello, World!
@{USER}    venkat     venki
&{USER_LIST}    name1=Venki    name2=Venki1

*** Test Cases ***
Introduction To Robot
	Do Something    ${MESSAGE}
	List out the Directory
	Output List Values
	
*** Keywords ***
Do Something
	[Arguments]    ${MESSAGE}
	Log    ${MESSAGE}
	Log    Hello,${SPACE}${SPACE}${SPACE}${SPACE}World!
	Log    Hello,\World!
	Log    ${USER}
	Log    ${USER}[0]
	Log    ${USER_LIST}
	Log    ${USER_LIST}[name1]
	Log    ${USER_LIST.name2}

List out the Directory
	List Directory    ${TEMPDIR}