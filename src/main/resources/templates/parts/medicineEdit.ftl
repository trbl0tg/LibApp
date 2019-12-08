<#include "security.ftl">


<a class="btn mb-3"  data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Medecine editor
</a>

    <div class="collapse my-3 <#if medicine??>show</#if>" id="collapseExample">


        <form method="post" enctype="multipart/form-data">

                <input type="text" class="form-control" style="width: 100%;"  ${(bookNameError??)?string('is-invalid', '')}"
                       value="<#if medicine??>${medicine.medicineName}</#if>" name="medicineName" placeholder="Name" />
                <#if bookNameError??>
                <div class="invalid-feedback">
                    ${bookNameError}
                </div>
                </#if>
            <input type="text" class="form-control mt-3" style="max-width: 500vh; width: 100%;"  name="medicineDetails" value="<#if medicine??>${medicine.medicineDetails}</#if>" placeholder="Price"/>
                <input type="text" class="form-control mt-3" style="max-width: 500vh; width: 100%;"  name="medicineAuthor" value="<#if medicine??>${medicine.medicineAuthor}</#if>" placeholder="Farmacy"/>
                <input type="text" class="form-control mt-3" style="max-width: 500vh; width: 100%;"  name="publishedIn" value="<#if medicine??>${medicine.publishedIn}</#if>" placeholder="Published in"/>
                <input type="text" class="form-control mt-3" style="max-width: 500vh; width: 100%;"  ${(tagError??)?string('is-invalid', '')}"
                       value="<#if medicine??>${medicine.tag}</#if>" name="tag" placeholder="Tag" />
                <#if tagError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
                </#if>

                <div class="custom-file mt-3" style="font-family: 'Uni Sans'">
                    <label class="custom-file-label" for="customFile">Choose medicine image</label>
                    <input type="file" name="file" id="customFile"/>
                </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if medicine??>${medicine.id}</#if>"/>
            <button type="submit" class="btn mt-3" >Save medicine</button>

        </form>

</div>