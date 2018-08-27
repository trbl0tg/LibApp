<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>




<div class="row">
    <div class="col"></div>
    <div class="col-2" style="min-width: 304px; margin-top: 17vh;">

            <div class="row justify-content-center mt-4" style="min-width: 330px; position: relative; right: 4%;">
                <img src="/static/logo.png" alt="logo" style="width: 26%; height: 100%; position: relative; top: 13px;">
                 <span style="color: #ffffff; font-size: 80px">LibApp</span>
            </div>
            <p class="row justify-content-center" style="color: #ffffff;  font-family: 'Uni Sans'; letter-spacing: 8px; opacity: .8">my pet project</p>

            <div class="line my-3" style="opacity: .8"></div>


            <@l.login "/login" false/>


           <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
            <div class="alert alert-danger mt-5" role="alert">
                ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
            </div>
           </#if>
           <#if message??>
            <div class="alert alert-${messageType}" role="alert">
                ${message}
            </div>
           </#if>

    </div>
    <div class="col"></div>
</div>

</@c.page>