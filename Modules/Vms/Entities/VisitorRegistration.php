<?php

namespace Modules\Vms\Entities;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Activitylog\LogOptions;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class VisitorRegistration implements HasMedia
{

    use HasFactory, SoftDeletes, InteractsWithMedia;
    protected $connection = "vms";
    protected $table = 'users';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $guarded = ['id', 'created_at', 'updated_at'];
    protected $appends = ['profile_image_url', 'cnic_front_url', 'cnic_back_url'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];



    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('user_profile');
        $this->addMediaCollection('cnic_front');
        $this->addMediaCollection('cnic_back');
    }


    public function getProfileImageUrlAttribute()
    {
        return $this->getFirstMediaUrl('user_profile');
    }

    public function getCnicFrontUrlAttribute()
    {
        return $this->getFirstMediaUrl('cnic_front');
    }

    public function getCnicBackUrlAttribute()
    {
        return $this->getFirstMediaUrl('cnic_back');
    }
}
