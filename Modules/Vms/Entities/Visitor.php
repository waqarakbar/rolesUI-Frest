<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Traits\BranchTrait;

class Visitor extends Model
{
    use HasFactory, SoftDeletes, BranchTrait, LogsActivity;
    protected $guarded = ['id', 'created_at', 'updated_at'];
    protected $appends = ['status_text', 'department_name', 'gate_name', 'visitor_name'];
    protected $connection = "vms";
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'text']);
        // Chain fluent methods for configuration options
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function gate()
    {
        return $this->belongsTo(Gate::class);
    }

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function getStatusTextAttribute()
    {

        $text = "Requested";
        switch ($this->status) {
            case 1:
                $text = "Visited";
                break;
            case 1:
                $text = "Requested";
                break;
            case 1:
                $text = "Approved";
                break;
            case 1:
                $text = "Rejected";
                break;
        }


        return $text;
    }

    public function getDepartmentNameAttribute()
    {
        return Department::where('id', $this->department_id)->value('title') ?? '';
    }

    public function getGateNameAttribute()
    {
        return Gate::where('id', $this->gate_id)->value('name') ?? '';
    }

    public function getVisitorNameAttribute()
    {
        return User::where('id', $this->user_id)->value('name') ?? '';
    }
}
