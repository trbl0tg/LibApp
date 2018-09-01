<#import "parts/common.ftl" as c>
<@c.page>

    <div class="row">
        <div class="col-8 " style="height: 88vh; overflow-y: scroll">
                <#include "parts/booksList.ftl"/>
        </div>
        <div class="col">

            <div class="form-group">


                <form method="get" action="/main" class="form-group">
                    <div class="row" style="padding: 0; margin: 0;">

                    <div class="col-md-8">

                    <input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search by tag filter" style="max-width: 1200px; width: 100%;"/>
                    </div>
                    <div class="col">
                    <button class="btn" type="submit" style="width: 100%;">Search</button>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-inline">
                                             <#include "parts/bookEdit.ftl"/>
                    </div>
                </div>
            </div>
            </div>


    </div>




</@c.page>