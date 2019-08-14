*** Settings ***
Documentation    Example Suite for REST API Multipart/form-data handling
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${HOST_URL}    http://localhost:5000
${API_PATH}    /insurance_card/extract/from_image
${SUBSCRIBER_NAME}    MARY SAMPLE

*** Test Cases ***
Post Request With URL Params
	Create Session	extract_from_image	${HOST_URL}
	${file}=    Get Binary File    metroplus.jpg
	&{data}=	Create Dictionary	subscriber_name=${SUBSCRIBER_NAME}
	&{file_data}=	Create Dictionary	card_image=${file}
	${resp}=    Post Request    extract_from_image    ${API_PATH}    data=${data}    files=${file_data}
	Should Be Equal As Strings    ${resp.status_code}    200
	${output}=    To Json    ${resp.content}    pretty_print=True
	Log    ${output}
	Delete All Sessions
	