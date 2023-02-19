<?php

namespace Modules\EIdentity\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\EIdentity\Entities\Employees;

class EIdentityController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        echo "dashboard";
        return view('eidentity::index');
    }

    public function list()
    {
        $data = [
            'title' => 'Employees  List',
            'new_route' => ['eidentity.employee.create', 'New Employee'],
            'employees' => Employees::limit(100)->get()
        ];

        return view('eidentity::employees.list',$data);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('eidentity::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        //
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
        return view('eidentity::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
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
}
