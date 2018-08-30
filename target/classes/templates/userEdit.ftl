<#import "parts/common.ftl" as c>

<@c.page>

<h1 class="m-3" style="font-family: 'Uni Sans'; color: #ffffff">USER EDIT</h1>

<div class="editUser" style="height: 10vh;">
</div>

<div class="container mt-5">
    <div class="row justify-content-md-center">
        <div class="col-5">
<form method="post" action="/user">
    <div class="form-group">
        <label for="username" style="color: #ffffff;">Username</label>
    <input type="text" class="form-control" name="username" id="username" value="${user.username}"/>

    <#list roles as role>
        <div style="position: relative; left: 30px; color: #ffffff" class="my-2">
            <label><input type="checkbox"  class="form-check-input" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>${role}</label>
        </div>
    </#list>

    <input type="hidden" name="userId" value="${user.id}"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" class="btn">Save </button>
    </div>
</form>
        </div>
    </div>
</div>

</@c.page>