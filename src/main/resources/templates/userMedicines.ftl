<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container">


    <#if isCurrentUser>
        <#include "parts/bookEdit.ftl" />
    </#if>
    <#include "parts/booksList.ftl" />
    </div>
</@c.page>
