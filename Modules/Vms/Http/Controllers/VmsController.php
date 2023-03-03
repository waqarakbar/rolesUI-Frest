<?php

namespace Modules\Vms\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Yajra\Datatables\Datatables;
use Modules\Vms\Entities\User;
use Modules\Vms\Entities\Visitor;
use App\Models\Department;

class VmsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $requested=Visitor::query()->where(['department_id'=>auth()->user()->department_id,'status'=>2])->count();
        $reject=Visitor::query()->where(['department_id'=>auth()->user()->department_id,'status'=>4])->count();
        $accept=Visitor::query()->where(['department_id'=>auth()->user()->department_id,'status'=>3])->count();
        $visited = Visitor::query()->where(['department_id'=>auth()->user()->department_id,'status'=>1])->count();
        return view('vms::index', compact('reject','accept','visited','requested'));
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('vms::create');
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
        return view('vms::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('vms::edit');
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
        //
    }
}