<#import "parts/common.ftl" as c>

<@c.page>

User edit


<form method="post" action="/user">
    <input type="text" name="username" value="${user.username}"/>

    <#list roles as role>
        <div>
            <label><input type="checkbox"  class="form-check-input" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>${role}</label>
        </div>
    </#list>

    <input type="hidden" name="userId" value="${user.id}"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit">Save </button>
</form>

</@c.page>