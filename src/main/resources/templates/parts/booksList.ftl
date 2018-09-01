<#include "security.ftl">

<table class="table" style="color: #ffffff">
    <thead>
    <tr style="background-color: #a5c7be;">
        <th style="border-color: #8aa8a0">Preview</th>
        <th style="border-color: #8aa8a0">Name</th>
        <th style="border-color: #8aa8a0">Author</th>
        <th style="border-color: #8aa8a0">Published</th>
        <th style="border-color: #8aa8a0">Tag</th>
        <th style="border-color: #8aa8a0">User</th>
    </tr>
    </thead>
    <tbody id="books-list">

  <#list books as book>
  <tr data-id="${book.id}">
      <td style="border-color: #8aa8a0">
            <#if book.filename??>
                <img class="preview" src="/img/${book.filename}"/>
            <#else>
                    No Image
            </#if>
      </td>
      <td style="border-color: #8aa8a0">
          <h5 style="font-family: 'Uni Sans'; color: #eeeeee; font-weight: bold">${book.bookName?ifExists}</h5>
          ${book.bookDetails?ifExists}


      </td>
      <td style="border-color: #8aa8a0">${book.bookAuthor?ifExists}</td>
      <td style="border-color: #8aa8a0">${book.publishedIn?ifExists}</td>
      <td style="border-color: #8aa8a0">#${book.tag?ifExists}</td>
      <td style="border-color: #8aa8a0"><a href="/user-books/${book.messageAuthor.id}">${book.messageAuthorName?ifExists}</a>
          <#if book.messageAuthor.id==currentUserId>
            <div>
                <a class="btn" href="/user-books/${book.messageAuthor.id}?book=${book.id}">Edit</a>
            </div>
          <div>
              <a href="/user-books/delete/${book.messageAuthor.id}?book=${book.id}">Delete</a>
          </div>
          </#if>
      </td>
  </tr>

  </#list>
    </tbody>
</table>