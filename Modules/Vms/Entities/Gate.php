<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Gate extends Model
{
    use HasFactory, SoftDeletes, LogsActivity;
    protected $guarded = ['id', 'created_at', 'updated_at'];


    //logging Activity of Model 
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'text']);
        // Chain fluent methods for configuration options
    }

    public function visitors()
    {
        return $this->hasMany(Visitor::class, 'gate_id');
    }
}
