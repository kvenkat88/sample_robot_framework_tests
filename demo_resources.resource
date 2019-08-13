*** Settings ***
Documentation     An example resource file

*** Variables ***
@{list_a}    one    two    three

*** Keywords ***
Output List Values
	[Documentation]   Prints the List Value and List
	Log   ${list_a}
	