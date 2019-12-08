<#include "security.ftl">

<table class="table" style="color: #ffffff">
    <thead>
    <tr style="background-color: #a5c7be;">
        <th style="border-color: #8aa8a0">Preview</th>
        <th style="border-color: #8aa8a0">Name/descr.</th>
        <th style="border-color: #8aa8a0">Faramcy</th>
        <th style="border-color: #8aa8a0">Published</th>
        <th style="border-color: #8aa8a0">Tag</th>
        <th style="border-color: #8aa8a0">User</th>
    </tr>
    </thead>
    <tbody id="medicines-list">

  <#list medicines as medicine>
  <tr data-id="${medicine.id}">
      <td style="border-color: #8aa8a0">
            <#if medicine.filename??>
                <img class="preview" src="/img/${medicine.filename}"/>
            <#else>
                    No Image
            </#if>
      </td>
      <td style="border-color: #8aa8a0">
          <h5 style="font-family: 'Uni Sans'; color: #eeeeee; font-weight: bold">${medicine.bookName?ifExists}</h5>
          ${medicine.bookDetails?ifExists}


      </td>
      <td style="border-color: #8aa8a0">${medicine.bookAuthor?ifExists}</td>
      <td style="border-color: #8aa8a0">${medicine.publishedIn?ifExists}</td>
      <td style="border-color: #8aa8a0">#${medicine.tag?ifExists}</td>
      <td style="border-color: #8aa8a0"><a href="/user-medicines/${medicine.messageAuthor.id}">${medicine.messageAuthorName?ifExists}</a>
          <#if medicine.messageAuthor.id==currentUserId>
            <div>
                <a class="btn" href="/user-medicines/${medicine.messageAuthor.id}?medicine=${medicine.id}">Edit</a>
            </div>
          <div>
              <a href="/user-medicines/delete/${medicine.messageAuthor.id}?medicine=${medicine.id}">Delete</a>
          </div>
          </#if>
      </td>
  </tr>

  </#list>
    </tbody>
</table>