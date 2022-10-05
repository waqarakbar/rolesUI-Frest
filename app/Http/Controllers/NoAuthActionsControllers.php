<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Modules\Settings\Entities\Company;
use Modules\Settings\Entities\District;
use Modules\Settings\Entities\Section;
use Modules\Settings\Entities\Tehsil;

class NoAuthActionsControllers extends Controller
{
    public function districtsByProvinceId(Request $request){
        $province_id = (int) $request->get('province_id');
        return District::where('province_id', $province_id)->pluck('title', 'id');
    }

    public function districtsByDivisionId(Request $request){
        $division_id = (int) $request->get('division_id');
        return District::where('division_id', $division_id)->pluck('title', 'id');
    }

    public function tehsilsByDistrictId(Request $request){
        $district_id = (int) $request->get('district_id');
        return Tehsil::where('district_id', $district_id)->pluck('title', 'id');
    }

    public function sectionsByCompanyId(Request $request){

        // return $request->all();

        $company_id = (int) $request->get('company_id');
        $sections = Section::with([
            'children' => function($q){
                $q->with('children');
            }
        ])->where('company_id', $company_id)->whereNull('parent_id');

        if($request->has('section_id')){
            // return 'here';
            $sections = $sections->whereNot('id', $request->get('section_id'));
        }
        $sections = $sections->get();
        // return $sections;

        $sections_dd = [];
        foreach($sections as $cdd){
            if($request->has('section_id') and $request->get('section_id') == $cdd->id){
                continue;
            }

            $sections_dd[$cdd->id] = $cdd->title;

            if($cdd->children->count() > 0){
                foreach($cdd->children as $cdd_cl1){
                    if($request->has('section_id') and $request->get('section_id') == $cdd_cl1->id){
                        continue;
                    }

                    $sections_dd[$cdd_cl1->id] = $cdd->title." -> ".$cdd_cl1->title;

                    if($cdd_cl1->children->count() > 0){
                        foreach($cdd_cl1->children as $cdd_cl2){
                            if($request->has('section_id') and $request->get('section_id') == $cdd_cl2->id){
                                continue;
                            }

                            $sections_dd[$cdd_cl2->id] = $cdd->title." -> ".$cdd_cl1->title." -> ".$cdd_cl2->title;
                        }
                    }

                }
            }
        }

        return $sections_dd;
    }


    public function usersListByCompanyId(Request $request){
        $company_id = (int) $request->get('company_id');
        $users_r = User::with([
            'company',
            'section'
        ])->where('company_id', $company_id);

        if($request->has('current_user')){
            $current_user_id = Crypt::decrypt($request->get('current_user'));
            $users_r = $users_r->whereNot('id', $current_user_id);
        }
        $users_r = $users_r->get();

        $users = [];
        foreach($users_r as $u){
            if($request->has('user_id') and $request->get('user_id') == $u->id){
                continue;
            }

            $user_title = $u->name;
            if(!is_null($u->section)){
                $user_title .= " (".$u->section->title.")";
            }
            $users[$u->id] = $user_title;
        }
        return $users;
    }

    public function companiesByTypeId(Request $request){
        $type_id = $request->get('department_type_id');
        if($request->has('is_crypt')){
            $type_id = Crypt::decrypt($type_id);
        }else{
            $type_id = (int) $type_id;
        }

        $comps = Company::with([
            'type',
            'level',
            'province',
            'division',
            'district'
        ])->where('company_type_id', $type_id)->get();

        $companies = [];
        foreach($comps as $comp){
            $comp_title = $comp->title." (".$comp->level->title.") ";
            if(!is_null($comp->district_id)){
                $comp_title .= " | District ".$comp->district->title;
            }

            if(!is_null($comp->division_id)){
                $comp_title .= " | Division ".$comp->division->title;
            }

            if(!is_null($comp->province)){
                $comp_title .= " - ".$comp->province->title;
            }

            if($request->has('is_crypt')){
                $companies[Crypt::encrypt($comp->id)] = $comp_title;
            }else{
                $companies[$comp->id] = $comp_title;
            }

        }

        return $companies;
    }
}
