<?php

namespace Modules\EIdentity\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Modules\EIdentity\Entities\BPS;
use Modules\EIdentity\Entities\Departments;
use Modules\EIdentity\Entities\Designations;
use Modules\EIdentity\Entities\EmployeeCategory;
use Modules\EIdentity\Entities\Employees;
use Modules\EIdentity\Entities\GuzzetedStatus;
use Modules\Settings\Entities\Company;
use Modules\Settings\Entities\MyApp;

class EIdentityController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $total_employees =Employees::where(['user_id'=>Auth::id()])->count();
        $total_pending =Employees::where(['user_id'=>Auth::id()])
            ->whereNull('profile_picture')
            ->whereNull('mobile_no')
                ->count();
        $total_update =Employees::where(['user_id'=>Auth::id()])
            ->whereNotNull('profile_picture')
            ->whereNotNull('mobile_no')
                ->count();

        $data = [
            'title'=>'Dashboard',
            'total_employees'=>$total_employees,
            'total_pending'=>$total_pending,
            'total_update'=>$total_update
        ];
        return view('eidentity::index',$data);
    }

    public function list()
    {
        $employees = Employees::with(['bps','designation'])
                    ->where(['user_id'=>Auth::id()])
                    ->orderByDesc('bps_id')
                    ->get();

//        pr($employees->toArray());
//        return "";

        $data = [
            'title' => 'Employees  List',
            'new_route' => ['eidentity.employee.create', 'New Employee'],
            'employees' => $employees
        ];

        return view('eidentity::employees.list',$data);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {

        $item               = new Employees();

        $bps_dd             = BPS::pluck('title','id');
        $employee_category  = EmployeeCategory::pluck('title','id');
        $designations       = Designations::pluck('title','id');
        $departments        = Company::whereNot('id',1)->orderBy('title','ASC')->pluck('title','id');
        $guzzeted_status    = GuzzetedStatus::pluck('title','id');

//print_r($item);
        $data = [
            'title' => 'Update Employee',
            'back_route' => ['eidentity.employee.list', 'Apps List'],
            'new_route' => ['eidentity.employee.create', 'New Employee'],
            'item' => $item,
            'bps_dd'=>$bps_dd,
            'employee_category'=>$employee_category,
            'designations'=>$designations,
            'departments'=>$departments,
            'guzzeted_status'=>$guzzeted_status,
        ];

        return view('eidentity::employees.form',$data);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {

        $request->validate([
            'department_id'=>"required|integer",
            'personnel_no'=>'required',
            'employee_name'=>"required|alpha_spaces|min:2|max:32",
            'father_name'=>"required|alpha_spaces|min:2|max:32",
            'mobile_no'=>"required|min:10|max:14",
            'bps_id'=>"required|integer",
            'employee_category_id'=>"required|integer",
            'guzzeted_id'=>"required|integer",
            'designation_id'=>"required|integer",
            'cnic'=>"required|integer",
            'dob'=>"required|date",
            'date_of_appointment'=>"required|date",
            'profile_picture'=>'mimes:jpg,bmp,png,tiff,jpeg'
        ],[
            'alpha_spaces'=>'only alpha charters(a-z A-Z) with space are acceptable'
        ]);

        $item     = new Employees();
        $fill_rec = $item->fill($request->all());
        $user = Auth::user();
        $user_id = $user->id;

        //profile picture upload
        if($request->hasFile('profile_picture')){

            // Get filename with the extension
            $filenameWithExt = $request->file('profile_picture')->getClientOriginalName();
            //Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('profile_picture')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore = unique_name().'.'.strtolower($extension);
            // Upload Image
            $path = $request->file('profile_picture')->storeAs('public/eidentity',$fileNameToStore);

            \request()->request->set('profile_picture',$fileNameToStore);

            $fill_rec->profile_picture = $fileNameToStore;
        }


        //save record
        $fill_rec->user_id = $user_id;
        $update   =$fill_rec->save();

        if($update){
            session()->flash('success','Employee record added successfully!');
            return to_route('eidentity.employee.list');
        }

        session()->flash('error','Employee record not, Please check again!');
        return to_route('eidentity.employee.list');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('eidentity::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {

        $item               = Employees::with(['bps','employeeCategory','designation','guzzetedStatus'])
                             ->find(Crypt::decrypt($id));

        $bps_dd             = BPS::pluck('title','id');
        $employee_category  = EmployeeCategory::pluck('title','id');
        $designations       = Designations::pluck('title','id');
        $departments        = Company::whereNot('id',1)->orderBy('title','ASC')->pluck('title','id');
        $guzzeted_status    = GuzzetedStatus::pluck('title','id');

//print_r($item);
        $data = [
            'title' => 'Update Employee',
            'back_route' => ['eidentity.employee.list', 'Apps List'],
            'new_route' => ['eidentity.employee.create', 'New Employee'],
            'item' => $item,
            'bps_dd'=>$bps_dd,
            'employee_category'=>$employee_category,
            'designations'=>$designations,
            'departments'=>$departments,
            'guzzeted_status'=>$guzzeted_status,
        ];


        return view('eidentity::employees.form',$data);
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'department_id'=>"required|integer",
            'personnel_no'=>'required',
            'employee_name'=>"required|alpha_spaces|min:2|max:32",
            'father_name'=>"required|alpha_spaces|min:2|max:32",
            'mobile_no'=>"required|min:10|max:14",
            'bps_id'=>"required|integer",
            'employee_category_id'=>"required|integer",
            'guzzeted_id'=>"required|integer",
            'designation_id'=>"required|integer",
            'cnic'=>"required|integer",
            'dob'=>"required|date",
            'date_of_appointment'=>"required|date",
            'profile_picture'=>'mimes:jpg,bmp,png,tiff,jpeg'
        ],[
            'alpha_spaces'=>'only alpha charters(a-z A-Z) with space are acceptable'
        ]);

        $item     = Employees::with(['bps','employeeCategory','designation'])->find(Crypt::decrypt($id));
        $fill_rec = $item->fill($request->all());

        //profile picture upload
        if($request->hasFile('profile_picture')){

            // Get filename with the extension
            $filenameWithExt = $request->file('profile_picture')->getClientOriginalName();
            //Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('profile_picture')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore = unique_name().'.'.strtolower($extension);
            // Upload Image
            $path = $request->file('profile_picture')->storeAs('public/eidentity',$fileNameToStore);

            \request()->request->set('profile_picture',$fileNameToStore);

            $fill_rec->profile_picture = $fileNameToStore;
        }


        //save record
        $update   =$fill_rec->save();

        if($update){
            session()->flash('success','Employee record updated successfully!');
            return to_route('eidentity.employee.list');
        }

        session()->flash('error','Employee record not, Please check again!');
        return to_route('eidentity.employee.list');

    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        $id         = decrypt($id);
        $employee   = Employees::find($id);

        if($employee->delete()){
            session()->flash('success', 'Employee deleted successfully');
            return redirect()->back();
        }


        session()->flash('error', 'Something went wrong, please try later');
        return redirect()->back();

    }

    public function departmentWiseReport(Request $request){

        $departments = Company::query()
            ->where('id','>',1)
            ->withCount([
                'employees',
                'employees as pending_mobile'=>function($q){
                    $q->whereNull('mobile_no');
                },
                'employees as pending_profile_pic'=>function($q){
                    $q->whereNull('profile_picture');
                }
            ])->get();

        //pr($departments->toArray(),true);
        $data = [
            'title'=>'Department Wise Report',
            'departments'=>$departments,

        ];

        return view('eidentity::reports.department-wise',$data);

    }
}
