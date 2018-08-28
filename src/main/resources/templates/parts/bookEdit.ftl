<#include "security.ftl">


<a class="btn"  data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Book editor
</a>



<div class="collapse mt-3 <#if book??>show</#if>" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(bookNameError??)?string('is-invalid', '')}"
                       value="<#if book??>${book.bookName}</#if>" name="bookName" placeholder="Name" />
                <#if bookNameError??>
                <div class="invalid-feedback">
                    ${bookNameError}
                </div>
                </#if>

            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="bookDetails" value="<#if book??>${book.bookDetails}</#if>" placeholder="Details"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="bookAuthor" value="<#if book??>${book.bookAuthor}</#if>" placeholder="Author"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="publishedIn" value="<#if book??>${book.publishedIn}</#if>" placeholder="Published in"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                       value="<#if book??>${book.tag}</#if>" name="tag" placeholder="Tag" />
                <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
                </#if>

            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile"/>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if book??>${book.id}</#if>"/>
            <button type="submit" class="btn">Save book</button>
        </form>
    </div>
</div>
