<#import "parts/common.ftl" as c>
<@c.page>

<div class="row">

    <div class="col">

        <#include "parts/booksList.ftl"/>
    </div>
    <div class="col">

        <form method="get" action="/main">
            <input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search by tag filter"/>
            <button class="btn" type="submit">Search</button>
            <#include "parts/bookEdit.ftl"/>

        </form>
    </div>

</div>



</@c.page>