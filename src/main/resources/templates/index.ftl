123${name}<br>
${boolValue?string("yes","no")}<br>
空值: ${blankvalue!"1"}<br>
对象：${siteobject.siteName}<br>
时间格式化：${date?string("yyyy-MM-dd")}<br>
html标签转义：${htmlContent?html}<br>
<#assign num='11'/>
<#if num=='10'>
    10
    <#elseif num=='11'>
    11
    <#else>
    12
</#if>
<br>
List集合遍历：
<#list list as item>
    ${item}
</#list>

<br>

map遍历
<#list map ? keys as key>
    ${key}:${map[key]}
</#list>