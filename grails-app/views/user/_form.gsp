<div class="card card-info">
    <div class="card-body">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail3" value="${user?.email ? user?.email : "" }" placeholder="Email">
            </div>
        </div>
        <div class="form-group row">
            <label  class="col-sm-2 col-form-label">Fullname</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="${user?.fullname ? user?.fullname : "" }" placeholder="Fullname">
            </div>
        </div>
        <div class="form-group row">
            <div class="offset-sm-2 col-sm-10">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck2">
                    <label class="form-check-label" for="exampleCheck2">Remember me</label>
                </div>
            </div>
        </div>
    </div>
</div>