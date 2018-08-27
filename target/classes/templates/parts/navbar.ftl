<#include "security.ftl">
<#import "login.ftl" as l>


<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="/">
        <img src="/static/logo.png" width="30" height="30" alt=""/>
        Libapp
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
                <#if isRegistrated>
            <li class="nav-item">
                <a class="nav-link" href="/main">Books</a>
            </li>

            <#if isAdmin>
                 <li class="nav-item">
                     <a class="nav-link " href="/user">UserList</a>
                 </li>
            </#if>

                 <li class="nav-item">
                     <a class="nav-link " href="/user/profile">Profile</a>
                 </li>

                <li class="nav-item">
                    <a class="nav-link " href="/user-books/${currentUserId}">My books</a>
                </li>

             </#if>

        </ul>

        <#if name!="unknown">
             <div class="navbar-text mr-4">${name}</div>
        </#if>
            <#if isRegistrated>
                <@l.logout />
            </#if>

    </div>
</nav>