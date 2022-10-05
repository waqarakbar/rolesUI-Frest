<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use jeremykenedy\LaravelRoles\Traits\HasRoleAndPermission;
use Laravel\Sanctum\HasApiTokens;
use Modules\IncidentReporting\Entities\AccusedType;
use Modules\IncidentReporting\Entities\AffiliationDesignation;
use Modules\IncidentReporting\Entities\BannedOrganization;
use Modules\IncidentReporting\Entities\Closure;
use Modules\IncidentReporting\Entities\DepartmentTypeIncidentType;
use Modules\IncidentReporting\Entities\Evidence;
use Modules\IncidentReporting\Entities\EvidenceType;
use Modules\IncidentReporting\Entities\GadgetType;
use Modules\IncidentReporting\Entities\Incident;
use Modules\IncidentReporting\Entities\IncidentComplainant;
use Modules\IncidentReporting\Entities\IncidentMotive;
use Modules\IncidentReporting\Entities\IncidentPerson;
use Modules\IncidentReporting\Entities\IncidentSource;
use Modules\IncidentReporting\Entities\IncidentStatus;
use Modules\IncidentReporting\Entities\IncidentStatusHistory;
use Modules\IncidentReporting\Entities\IncidentType;
use Modules\IncidentReporting\Entities\Mobility;
use Modules\IncidentReporting\Entities\MobilityType;
use Modules\IncidentReporting\Entities\Person;
use Modules\IncidentReporting\Entities\Place;
use Modules\IncidentReporting\Entities\PoiAffiliation;
use Modules\IncidentReporting\Entities\PoiAttachment;
use Modules\IncidentReporting\Entities\PoiAttachmentType;
use Modules\IncidentReporting\Entities\PoiStatusHistory;
use Modules\IncidentReporting\Entities\PoliceStation;
use Modules\IncidentReporting\Entities\Priority;
use Modules\IncidentReporting\Entities\Recovery;
use Modules\IncidentReporting\Entities\RecoveryType;
use Modules\IncidentReporting\Entities\Religion;
use Modules\IncidentReporting\Entities\Spectrum;
use Modules\IncidentReporting\Entities\SpectrumAssignment;
use Modules\IncidentReporting\Entities\VehicleBrand;
use Modules\IncidentReporting\Entities\VehicleType;
use Modules\Settings\Entities\Company;
use Modules\Settings\Entities\MyPermission;
use Modules\Settings\Entities\MyRole;
use Modules\Settings\Entities\Section;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoleAndPermission;
    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'username',
        'password',
        'company_id',
        'section_id',
        'parent_id',
        'description'
    ];

    protected $connection = "mysql";

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $with = ['roles'];


    public function companies(){
        return $this->hasMany(Company::class);
    }

    // user and permission many to many
    public function permissions(){
        return $this->belongsToMany(MyPermission::class, 'permission_user', 'user_id', 'permission_id')->withTimestamps();
    }



    // user and roles many to many
    public function roles(){
        return $this->belongsToMany(MyRole::class, 'role_user', 'user_id', 'role_id')->withTimestamps();
    }

    public function parent(){
        return $this->belongsTo(User::class, 'parent_id', 'id');
    }

    public function children(){
        return $this->hasMany(User::class, 'parent_id', 'id');
    }

    public function company(){
        return $this->belongsTo(Company::class, 'company_id', 'id');
    }

    public function section(){
        return $this->belongsTo(Section::class, 'section_id', 'id');
    }

    // spectrums created by this user
    public function spectrums(){
        return $this->hasMany(Spectrum::class, 'user_id', 'id');
    }

    public function spectrumAssignments(){
        return $this->hasMany(SpectrumAssignment::class, 'user_id', 'id');
    }

    public function departmentTypeIncidentType()
    {
        return $this->hasMany(DepartmentTypeIncidentType::class, 'user_id', 'id');
    }

    public function evidences()
    {
        return $this->hasMany(Evidence::class, 'user_id', 'id');
    }

    public function evidenceTypes()
    {
        return $this->hasMany(EvidenceType::class, 'user_id', 'id');
    }

    public function incidents()
    {
        return $this->hasMany(Incident::class, 'user_id', 'id');
    }

    public function complainants()
    {
        return $this->hasMany(IncidentComplainant::class, 'user_id', 'id');
    }

    public function incidentMotives()
    {
        return $this->hasMany(IncidentMotive::class, 'user_id', 'id');
    }

    public function incidentSources()
    {
        return $this->hasMany(IncidentSource::class, 'user_id', 'id');
    }

    public function incidentStatuses()
    {
        return $this->hasMany(IncidentStatus::class, 'user_id', 'id');
    }

    public function statusHistories()
    {
        return $this->hasMany(IncidentStatusHistory::class, 'user_id', 'id');
    }

    public function incidentTypes()
    {
        return $this->hasMany(IncidentType::class, 'user_id', 'id');
    }

    public function policeStations()
    {
        return $this->hasMany(PoliceStation::class, 'user_id', 'id');
    }

    public function priorities()
    {
        return $this->hasMany(Priority::class, 'user_id', 'id');
    }

    public function accusedTypes()
    {
        return $this->hasMany(AccusedType::class, 'user_id', 'id');
    }

    public function affiliationDesignations()
    {
        return $this->hasMany(AffiliationDesignation::class, 'user_id', 'id');
    }

    public function bannedOrganizations()
    {
        return $this->hasMany(BannedOrganization::class, 'user_id', 'id');
    }

    public function incidentPersons()
    {
        return $this->hasMany(IncidentPerson::class, 'user_id', 'id');
    }

    public function persons()
    {
        return $this->hasMany(Person::class, 'user_id', 'id');
    }

    public function poiAffiliations()
    {
        return $this->hasMany(PoiAffiliation::class, 'user_id', 'id');
    }

    public function poiAttachments()
    {
        return $this->hasMany(PoiAttachment::class, 'user_id', 'id');
    }

    public function poiAttachmentTypes()
    {
        return $this->hasMany(PoiAttachmentType::class, 'user_id', 'id');
    }

    public function poiStatuses()
    {
        return $this->hasMany(User::class, 'user_id', 'id');
    }

    public function poiStatusHistories()
    {
        return $this->hasMany(PoiStatusHistory::class, 'user_id', 'id');
    }

    public function religions()
    {
        return $this->hasMany(Religion::class, 'user_id', 'id');
    }

    public function places()
    {
        return $this->hasMany(Place::class, 'user_id', 'id');
    }

    public function gadgetTypes()
    {
        return $this->hasMany(GadgetType::class, 'user_id', 'id');
    }

    public function vehicleBrands()
    {
        return $this->hasMany(VehicleBrand::class, 'user_id', 'id');
    }

    public function vehicleTypes()
    {
        return $this->hasMany(VehicleType::class, 'user_id', 'id');
    }

    public function mobilityTypes()
    {
        return $this->hasMany(MobilityType::class, 'user_id', 'id');
    }

    public function mobilities()
    {
        return $this->hasMany(Mobility::class, 'user_id', 'id');
    }

    public function recoveryTypes()
    {
        return $this->hasMany(RecoveryType::class, 'user_id', 'id');
    }

    public function recoveries()
    {
        return $this->hasMany(Recovery::class, 'user_id', 'id');
    }

    public function closures()
    {
        return $this->hasMany(Closure::class, 'user_id', 'id');
    }
}
