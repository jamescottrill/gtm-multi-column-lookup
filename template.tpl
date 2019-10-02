___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Four Column Lookup",
  "description": "A Four Column Lookup Table. Returns an array of three values. Individual values can be selected using a Custom JavaScript Variable.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ],
  "brand": {}
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Input Variable",
    "simpleValueType": true,
    "name": "inputVar",
    "type": "TEXT"
  },
  {
    "alwaysInSummary": true,
    "displayName": "Lookup Table",
    "name": "lookupTable",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Input",
        "name": "inputVal",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output 1",
        "name": "output1",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output 2",
        "name": "output2",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output 3",
        "name": "output3",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE"
  },
  {
    "simpleValueType": true,
    "name": "defaultChecked",
    "checkboxText": "Set Default Value",
    "type": "CHECKBOX"
  },
  {
    "help": "To return an array as the default value, provide outputs as pipe separated strings. If you need the pipe in your output, you'll need to change the template.",
    "enablingConditions": [
      {
        "paramName": "defaultChecked",
        "type": "EQUALS",
        "paramValue": true
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Default Value",
    "simpleValueType": true,
    "name": "defaultValue",
    "type": "TEXT"
  },
  {
    "help": "Select options below to format the value that will be output by this variable. This will format each value in the array, the 'Format Value' field will try and format the array itself.",
    "displayName": "Format Array",
    "name": "format",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "simpleValueType": true,
        "name": "convertCase",
        "checkboxText": "Convert Case to…",
        "type": "CHECKBOX"
      },
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "Lowercase",
            "value": "lowercase"
          },
          {
            "displayValue": "Uppercase",
            "value": "uppercase"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "convertCase",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertCaseTo",
        "type": "SELECT"
      },
      {
        "simpleValueType": true,
        "name": "convertNull",
        "checkboxText": "Convert null to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertNull",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertNullTo",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "convertUndefined",
        "checkboxText": "Convert undefined to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertUndefined",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertUndefinedTo",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "convertTrue",
        "checkboxText": "Convert true to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertTrue",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertTrueTo",
        "type": "TEXT"
      },
      {
        "simpleValueType": true,
        "name": "convertFalse",
        "checkboxText": "Convert false to…",
        "type": "CHECKBOX"
      },
      {
        "enablingConditions": [
          {
            "paramName": "convertFalse",
            "type": "EQUALS",
            "paramValue": true
          }
        ],
        "displayName": "",
        "simpleValueType": true,
        "name": "convertFalseTo",
        "type": "TEXT"
      }
    ]
  },
  {
    "displayName": "Advanced Settings",
    "name": "advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "Pipe",
            "value": "|"
          },
          {
            "displayValue": "Comma",
            "value": ","
          },
          {
            "displayValue": "Semi-Colon",
            "value": ";"
          },
          {
            "displayValue": "Custom",
            "value": "custom"
          }
        ],
        "displayName": "Delimiter",
        "simpleValueType": true,
        "name": "delimiter",
        "type": "SELECT",
        "help": "This is the delimiter between the values in your default value. It defaults to Pipe delimited, so you may need to change this."
      },
      {
        "displayName": "Custom Delimiter",
        "simpleValueType": true,
        "name": "customDelimiter",
        "type": "TEXT",
        "enablingConditions": [
          {
            "paramName": "delimiter",
            "paramValue": "custom",
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          },
          {
            "type": "REGEX",
            "args": [
              "[^a-zA-Z0-9]"
            ]
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//Require APIs
const makeString = require('makeString');
//Access Tag Values
const inputVar = makeString(data.inputVar);
const table = data.lookupTable || [];
const defaultValue = data.defaultValue;
//Format Value Values
const convertCaseTo = data.convertCaseTo;
const convertCase = data.convertCase;
const convertNullTo = data.convertNullTo;
const convertNull = data.convertNull;
const convertUndefinedTo = data.convertUndefinedTo;
const convertUndefined = data.convertUndefined;
const convertTrueTo = data.convertTrueTo;
const convertTrue = data.convertTrue;
const convertFalseTo = data.convertFalseTo;
const convertFalse = data.convertFalse;
const delimiter = data.delimiter !=='custom' ? data.delimiter : data.customDelimiter;

return table.filter(row => {
  return row.inputVal === inputVar;
}).map(matchedRow => {
  return [matchedRow.output1, matchedRow.output2, matchedRow.output3].map(output => {
    if (convertUndefined && output === undefined) {
      return convertUndefinedTo;
    }
    if (convertNull && output === null) {
      return convertNullTo;
    }
    if (convertTrue && output === true) {
      return convertTrueTo;
    }
    if (convertFalse && output === false) {
      return convertFalseTo;
    }
    return output;
  }).map(output => {
    if (convertCaseTo === 'lowercase') {
      return output.toLowerCase();
    }
    if (convertCaseTo === 'uppercase') {
      return output.toUpperCase();
    }
    return output;
  });
}).shift() || (defaultValue ? defaultValue.split(delimiter) : undefined);


___NOTES___

Created on 14/08/2019, 15:10:35
