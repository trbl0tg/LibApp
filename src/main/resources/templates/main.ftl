<#import "parts/common.ftl" as c>
<@c.page>


<div class="form-row">
    <form method="get" action="/main" class="form-inline">
        <input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search by tag filter"/>
        <button class="btn btn-outline-secondary mx-5" type="submit">Search</button>
    </form>

<#include "parts/bookEdit.ftl"/>

<#include "parts/booksList.ftl"/>

</@c.page>