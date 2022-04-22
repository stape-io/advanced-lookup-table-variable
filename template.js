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
