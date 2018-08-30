<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>


<div class="row">
    <div class="col"></div>
    <div class="col-2 " style="min-width: 304px;">

        <div style="height: 10vh;"></div>

        <div class="mb-4" style="font-family: 'Uni Sans'; color: #ffffff;"><h1>Registration</h1></div>
<@l.login "/registration" true />


    ${message?ifExists}

    </div>
    <div class="col"></div>
</div>
</@c.page>


