<?php

namespace Modules\EIdentity\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Employees extends Model
{
    use SoftDeletes;

    protected $connection = "eidentity";

    protected $fillable = ['employee_uuid','grant_no','grant_desc','fund','fund_desc','user_id','department_id','department_name',
'personnel_no','employee_name','father_name','mobile_no','pr_code','ddo','ddo_desc','bps_id','bps',
'cash_center','employee_category_id','employee_category','guzzeted_id','designation_id','designation',
'designation_code','cnic','dob','date_of_appointment','profile_picture'];


}
