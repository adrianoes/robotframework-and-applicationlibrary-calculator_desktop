*** Settings ***
Library           OperatingSystem
Library           BuiltIn
Library           FakerLibrary
Library           String
Library           Collections
Library           Process
Library           ApplicationLibrary.DesktopLibrary.DesktopLibrary

*** Variables ***
${WINAPPDRIVER_PATH}    C:/Program Files/Windows Application Driver/WinAppDriver.exe

*** Keywords ***
Start WinAppDriver
    [Documentation]    Starts the WinAppDriver server.
    Run Process    ${WINAPPDRIVER_PATH}    shell=True    stdout=PIPE    stderr=PIPE    alias=winappdriver
    Sleep    3s

Stop WinAppDriver
    [Documentation]    Stops the WinAppDriver server.
    Terminate Process    winappdriver

Choose Random Numbers
    [Documentation]    Generates two random integers between 0 and 9.
    ${a}=    FakerLibrary.Random Int    0    9
    ${b}=    FakerLibrary.Random Int    0    9
    Set Suite Variable    ${a}
    Set Suite Variable    ${b}

Press Number
    [Arguments]    ${num}
    [Documentation]    Presses the calculator button corresponding to number ${num}.
    Wait For And Click Element    accessibility_id=num${num}Button
    Sleep    0.5s

Press Operator
    [Arguments]    ${operator}
    [Documentation]    Presses the calculator button for the given operator.
    ${mapping}=    Create Dictionary    add=plusButton    subt=minusButton    mult=multiplyButton    div=divideButton    equal=equalButton    x2=xpower2Button    sqrt=squareRootButton
    ${button}=    Get From Dictionary    ${mapping}    ${operator}
    Wait For And Click Element    accessibility_id=${button}
    Sleep    0.5s

Get Calculator Result
    [Documentation]    Get the calculator result text from the UI element.
    ${text}=    Get Element Attribute    accessibility_id=CalculatorResults    Name
    ${clean}=    Replace String    ${text}    Display is    ${EMPTY}
    ${clean}=    Replace String    ${clean}    A exibição é    ${EMPTY}
    ${clean}=    Strip String    ${clean}
    RETURN    ${clean}

Validate Result
    [Arguments]    ${actual}    ${expected}
    [Documentation]    Validates that the actual result equals the expected result, as numbers.
    ${actual_num}=    Convert To Number    ${actual}
    ${expected_num}=    Convert To Number    ${expected}
    Should Be Equal As Numbers    ${actual_num}    ${expected_num}

Convert To Number
    [Arguments]    ${value}
    ${value}=    Convert To String    ${value}
    ${value}=    Replace String    ${value}    ,    .
    ${float_value}=    Evaluate    float(${value})
    ${int_result}=    Run Keyword And Ignore Error    Evaluate    int(${float_value})
    Run Keyword If    '${int_result}[0]' == 'PASS' and ${float_value} == ${int_result}[1]    Return From Keyword    ${int_result}[1]
    RETURN    ${float_value}

Add Two Numbers
    [Documentation]    Adds two random numbers using calculator and validates result.
    Choose Random Numbers
    Press Number    ${a}
    Press Operator  add
    Press Number    ${b}
    Press Operator  equal
    ${calc_result}=    Get Calculator Result
    ${expected}=    Evaluate    ${a} + ${b}
    Validate Result    ${calc_result}    ${expected}

Subtract Two Numbers
    [Documentation]    Subtracts two random numbers using calculator and validates result.
    Choose Random Numbers
    Press Number    ${a}
    Press Operator  subt
    Press Number    ${b}
    Press Operator  equal
    ${calc_result}=    Get Calculator Result
    ${expected}=    Evaluate    ${a} - ${b}
    Validate Result    ${calc_result}    ${expected}

Multiply Two Numbers
    [Documentation]    Multiplies two random numbers using calculator and validates result.
    Choose Random Numbers
    Press Number    ${a}
    Press Operator  mult
    Press Number    ${b}
    Press Operator  equal
    ${calc_result}=    Get Calculator Result
    ${expected}=    Evaluate    ${a} * ${b}
    Validate Result    ${calc_result}    ${expected}

Divide Two Numbers
    [Documentation]    Divides two random numbers using calculator and validates result.
    Choose Random Numbers
    Run Keyword If    '${b}' == '0'    Set Suite Variable    ${b}    1
    Press Number    ${a}
    Press Operator  div
    Press Number    ${b}
    Press Operator  equal
    ${calc_result}=    Get Calculator Result
    ${expected}=    Evaluate    round(${a} / ${b}, 10)
    Validate Result    ${calc_result}    ${expected}

Square Number
    [Documentation]    Squares a random number using calculator and validates result.
    Choose Random Numbers
    Press Number    ${a}
    Press Operator  x2
    Press Operator  equal
    ${calc_result}=    Get Calculator Result
    ${expected}=    Evaluate    ${a} ** 2
    Validate Result    ${calc_result}    ${expected}

Square Root Number
    [Documentation]    Calculates the square root of a random number using calculator and validates result.
    Choose Random Numbers
    Press Number    ${a}
    Press Operator  sqrt
    ${calc_result}=    Get Calculator Result
    ${expected}=    Evaluate    round(${a} ** 0.5, 10)
    Validate Result    ${calc_result}    ${expected}
