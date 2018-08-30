<#import "parts/common.ftl" as c>

<@c.page>

<h1 class="m-4" style="font-family: 'Uni Sans'; color: #ffffff">List of users</h1>

<div class="row justify-content-md-center">
<div class="col" style="max-width: 90vw; font-family: 'Uni Sans'; color: #ffffff">

    <table class="table mt-5">

        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>

        <tbody>

       <#list users as user>

       <tr>
           <td>${user.username}</td>
           <td>
               <#list user.roles as role>
                   ${role}<#sep> ,
               </#list>
           </td>

           <td><a href="/user/${user.id}">edit</a></td>

       </tr>

       </#list>

        </tbody>

    </table>
</div>

</div>


</@c.page>