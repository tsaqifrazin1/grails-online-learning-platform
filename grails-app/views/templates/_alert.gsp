<g:if test="${flash.message}">
    %{--<g:flash--}%
    <div id="toastsContainerTopRight" class="toasts-top-right">
        <g:if test="${flash.message?.info != null && flash.message?.success != null}">
            <g:if test="${flash.message.success}">
                <div id="toast-container" class="toast-top-right toast-warning-timeout">
                    <div class="toast toast-success" aria-live="assertive" style="">
                        <div class="toast-message">${flash.message.info}</div>
                    </div>
                </div>
            </g:if>
            <g:else>
                <div id="toast-container" class="toast-top-right toast-warning-timeout">
                    <div class="toast toast-error" aria-live="assertive" style="">
                        <div class="toast-message">${raw(flash.message.info)}</div>
                    </div>
                </div>
            </g:else>
        </g:if>
    </div>
</g:if>