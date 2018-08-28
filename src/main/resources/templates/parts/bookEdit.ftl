<#include "security.ftl">


<a class="btn"  data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Book editor
</a>

    <div class="collapse mt-3 <#if book??>show</#if>" id="collapseExample">


        <form method="post" enctype="multipart/form-data">

            <div class="form-group">

                </div>
                <input type="text" class="form-control" style="max-width: 500vh; width: 100%;"  ${(bookNameError??)?string('is-invalid', '')}"
                       value="<#if book??>${book.bookName}</#if>" name="bookName" placeholder="Name" />
                <#if bookNameError??>
                <div class="invalid-feedback">
                    ${bookNameError}
                </div>
                </#if>
                <input type="text" class="form-control" style="max-width: 500vh; width: 100%;"  name="bookDetails" value="<#if book??>${book.bookDetails}</#if>" placeholder="Details"/>
                <input type="text" class="form-control" style="max-width: 500vh; width: 100%;"  name="bookAuthor" value="<#if book??>${book.bookAuthor}</#if>" placeholder="Author"/>
                <input type="text" class="form-control" style="max-width: 500vh; width: 100%;"  name="publishedIn" value="<#if book??>${book.publishedIn}</#if>" placeholder="Published in"/>
                <input type="text" class="form-control" style="max-width: 500vh; width: 100%;"  ${(tagError??)?string('is-invalid', '')}"
                       value="<#if book??>${book.tag}</#if>" name="tag" placeholder="Tag" />
                <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
                </#if>

                <div class="custom-file">
                    <input type="file" name="file" id="customFile"/>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if book??>${book.id}</#if>"/>
            <button type="submit" class="btn">Save book</button>

        </form>

</div>
