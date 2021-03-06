

<#macro login path isRegisterForm>


    <form action="${path}" method="post">
        <div class="form-group row">

                <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Username" value="<#if user??>${user.username}</#if>"/>
                       <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
                       </#if>
        </div>

    <#if isRegisterForm>
           <div class="form-group row">
                   <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                          placeholder="some@some.com" value="<#if user??>${user.email}</#if>"/>
                  <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
                  </#if>
           </div>

    </#if>

        <div class="form-group row">
                <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Password"/>
                            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
                            </#if>
        </div>

    <#if isRegisterForm>



            <div class="form-group row">
                    <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}" placeholder="Repeat password"/>
                            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
                            </#if>
            </div>
    <div class="form-group row">
        <div class="g-recaptcha" data-sitekey="6LcpnWoUAAAAABMPqtaj9y-IhQY5P5xMjnKCd6zU"></div>

                <#if captchaError??>

                    <div style="color: red" role="alert">
                        ${captchaError}
                    </div>
                </#if>
    </div>
    </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <div class="row">
    <#if !isRegisterForm>
    <div class="col mr-1" id="btnstack">
        <#--<a href="/registration" class="mr-5">Add new user</a>-->
        <input type="button" class="btn" value="Create" onclick="location.href='/registration'">
    </div>
    </#if>
            <div class="col" id="btnstack"">
        <button class="btn" type="submit"><#if isRegisterForm>Register<#else>Sign In</#if></button>
            </div>
        </div>
    </form>

</#macro>

<#macro logout>
           <form action="/logout" method="post">
               <input type="submit" class="btn" value="Sign Out"/>
               <input type="hidden" name="_csrf" value="${_csrf.token}"/>
           </form>
</#macro>