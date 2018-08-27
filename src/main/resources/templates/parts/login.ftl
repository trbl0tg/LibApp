<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-4">
                <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Username" value="<#if user??>${user.username}</#if>"/>
                       <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
                       </#if>
            </div>
        </div>

    <#if isRegisterForm>
           <div class="form-group row">
               <label class="col-sm-2 col-form-label"> Email : </label>
               <div class="col-sm-4">
                   <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                          placeholder="some@some.com" value="<#if user??>${user.email}</#if>"/>
                  <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
                  </#if>
               </div>
           </div>

    </#if>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password : </label>
            <div class="col-sm-4">
                <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Password"/>
                            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
                            </#if>
            </div>
        </div>

    <#if isRegisterForm>



            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Repeat password : </label>
                <div class="col-sm-4">
                    <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}" placeholder="Repeat password"/>
                            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
                            </#if>
                </div>
            </div>

    <div class="col-sm-6">
        <div class="g-recaptcha my-3" data-sitekey="6LcpnWoUAAAAABMPqtaj9y-IhQY5P5xMjnKCd6zU"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
    </div>

    </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <#if !isRegisterForm><a href="/registration" class="mr-5">Add new user</a></#if>

        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Register<#else>Sign In</#if></button>

    </form>
</#macro>

<#macro logout>
           <form action="/logout" method="post">
               <input type="submit" class="btn btn-primary" value="Sign Out"/>
               <input type="hidden" name="_csrf" value="${_csrf.token}"/>
           </form>
</#macro>