<div class="card card-info">
        <form class="form-horizontal">
        <div class="card-body">
            <g:each in="${domainProperties}" var="p">
                <g:if test="${p.optional}">
                    <div class="form-group row ${p.optional}">
                        <label for="${p.name}" class="col-sm-2 col-form-label">${p.naturalName}
                                <span class="required-indicator">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="${p.name}" name="${p.name}" required value id="${p.name}" class="form-control"  placeholder="${p.naturalName}">
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class="form-group row>
                        <label for="${p.name}" class="col-sm-2 col-form-label">${p.naturalName}</label>
                        <div class="col-sm-10">
                            <input type="${p.name}" name="${p.name}" value id="${p.name}" class="form-control"  placeholder="${p.naturalName}">
                        </div>
                    </div>
                </g:else>
            </g:each>
        </div>
    </form>
</div>