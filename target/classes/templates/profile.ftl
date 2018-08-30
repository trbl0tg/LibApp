<#import "parts/common.ftl" as c>
<@c.page>

<h4 class="m-4" style="color: #ffffff" >${username}</h4>

<h1 class="m-3" style="font-family: 'Uni Sans'; color: #ffffff">USER EDIT</h1>

<div class="editUser" style="height: 10vh;">
</div>

<div class="container mt-5">
    <div class="row justify-content-md-center">
        <div class="col-5">

    <form method="post">

    ${message?ifExists}
        <div class="form-group">
            <label for="password" style="color: #ffffff">Password</label>
                <input type="password" id="password" name="password" class="form-control"/>

        </div>
        <div class="form-group">
            <label style="color: #ffffff" >New Email</label>
                <input type="email" name="email" class="form-control" value="${email!''}"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>


        <button class="btn" type="submit">Submit</button>

    </form>
        </div>
    </div>
</div>
</@c.page>