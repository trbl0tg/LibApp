<#import "parts/common.ftl" as c>
<@c.page>

    <div class="row">
        <div class="col-8 " style="height: 88vh; overflow: scroll">
                <#include "parts/booksList.ftl"/>
        </div>
        <div class="col">

                <form method="get" action="/main" class="form-inline">
                    <div class="row" style="padding: 0; margin: 0;">

                    <div class="col-sm-8">
                    <input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search by tag filter" style="max-width: 400px; width: 100%;"/>
                    </div>
                    <div class="col">
                    <button class="btn" type="submit" style="width: 100%;">Search</button>
                    </div>
                </form>

            <div class="col">
                         <#include "parts/bookEdit.ftl"/>

            </div>






        </div>
    </div>




</@c.page>