<#import "parts/common.ftl" as c>
<@c.page>
<h4>${username}</h4>
    <form method="post">
    ${message?ifExists}
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password : </label>
            <div class="col-sm-4">
                <input type="password" name="password" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email : </label>
            <div class="col-sm-4">
                <input type="email" name="email" class="form-control" value="${email!''}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>


        <button class="btn btn-primary" type="submit">Submit</button>

    </form>

</@c.page>