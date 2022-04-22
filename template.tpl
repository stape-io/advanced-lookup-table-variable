___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Advanced Lookup Table",
  "description": "Lookup table with \"If Then Else\" logic.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "alwaysInSummary": false,
    "displayName": "Lookup Table",
    "name": "table",
    "simpleTableColumns": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "If",
        "name": "inputOne",
        "type": "TEXT"
      },
      {
        "selectItems": [
          {
            "displayValue": "equals",
            "value": "equals"
          },
          {
            "displayValue": "contains",
            "value": "contains"
          },
          {
            "displayValue": "starts with",
            "value": "startsWith"
          },
          {
            "displayValue": "ends with",
            "value": "endsWith"
          },
          {
            "displayValue": "matches RegEx",
            "value": "matchesRegEx"
          },
          {
            "displayValue": "matches RegEx (ignore case)",
            "value": "matchesRegExIgnoreCase"
          },
          {
            "displayValue": "does not equal",
            "value": "doesNotEqual"
          },
          {
            "displayValue": "does not contain",
            "value": "doesNotContain"
          },
          {
            "displayValue": "does not start with",
            "value": "doesNotStartWith"
          },
          {
            "displayValue": "does not end with",
            "value": "doesNotEndWith"
          },
          {
            "displayValue": "does not match RegEx",
            "value": "doesNotMatchRegEx"
          },
          {
            "displayValue": "does not match RegEx (ignore case)",
            "value": "doesNotMatchRegExIgnoreCase"
          },
          {
            "displayValue": "less than",
            "value": "lessThan"
          },
          {
            "displayValue": "less than or equal to",
            "value": "lessThanOrEqualTo"
          },
          {
            "displayValue": "greater than",
            "value": "greaterThan"
          },
          {
            "displayValue": "greater than or equal to",
            "value": "greaterThanOrEqualTo"
          }
        ],
        "defaultValue": "equals",
        "displayName": "",
        "name": "rule",
        "type": "SELECT"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "This",
        "name": "inputTwo",
        "isUnique": false,
        "type": "TEXT"
      },
      {
        "selectItems": [],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "Return",
        "name": "output",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "+Add row"
  },
  {
    "type": "CHECKBOX",
    "name": "setDefaultValue",
    "checkboxText": "Set Default Value",
    "simpleValueType": true,
    "help": "Explicitly set the value of this variable when no match is found in the lookup table."
  },
  {
    "type": "TEXT",
    "name": "defaultValue",
    "displayName": "Default Value",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "setDefaultValue",
        "paramValue": true,
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

if (data.table && data.table.length) for (let i = 0; i < data.table.length; i++) {
    const row = data.table[i];
    const inputOne = normalize(row.inputOne);
    const inputTwo = normalize(row.inputTwo);

    if (row.rule === 'equals' && inputOne == inputTwo) return row.output;
    if (row.rule === 'contains' && (inputOne.indexOf(inputTwo) > -1)) return row.output;
    if (row.rule === 'startsWith' && inputOne.match('^(' + inputTwo + ')')) return row.output;
    if (row.rule === 'endsWith' && inputOne.match('(' + inputTwo + ')$')) return row.output;
    if (row.rule === 'matchesRegEx' && inputOne.match(inputTwo)) return row.output;
    if (row.rule === 'matchesRegExIgnoreCase' && inputOne.toLowerCase().match(inputTwo.toLowerCase())) return row.output;
    if (row.rule === 'doesNotEqual' && inputOne != inputTwo) return row.output;
    if (row.rule === 'doesNotContain' && (inputOne.indexOf(inputTwo) < -1)) return row.output;
    if (row.rule === 'doesNotStartWith' && !inputOne.match('^(' + inputTwo + ')')) return row.output;
    if (row.rule === 'doesNotEndWith' && !inputOne.match('(' + inputTwo + ')$')) return row.output;
    if (row.rule === 'doesNotMatchRegEx' && !inputOne.match(inputTwo)) return row.output;
    if (row.rule === 'doesNotMatchRegExIgnoreCase' && !inputOne.toLowerCase().match(inputTwo.toLowerCase())) return row.output;
    if (row.rule === 'lessThan' && inputOne < inputTwo) return row.output;
    if (row.rule === 'lessThanOrEqualTo' && inputOne <= inputTwo) return row.output;
    if (row.rule === 'greaterThan' && inputOne > inputTwo) return row.output;
    if (row.rule === 'greaterThanOrEqualTo' && inputOne >= inputTwo) return row.output;
}

return data.setDefaultValue ? data.defaultValue : undefined;


function normalize(value)
{
    if ((typeof value) === 'undefined') return 'undefined';
    if ((typeof value) === 'boolean') return value ? 'true' : 'false';

    return value;
}


___TESTS___

scenarios: []


___NOTES___

Created on 22/04/2022, 19:59:53


