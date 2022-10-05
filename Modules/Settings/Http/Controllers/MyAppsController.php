<?php

namespace Modules\Settings\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Session;
use Modules\Settings\Entities\MyApp;

class MyAppsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $data = [
            'title' => 'Apps List',
            'new_route' => ['settings.my-apps.create', 'New App'],
            'my_apps' => MyApp::all()
        ];

        return view('settings::my_apps.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create(MyApp $item)
    {
        $data = [
            'title' => 'Create a New App',
            'back_route' => ['settings.my-apps.list', 'Apps List'],
            'new_route' => ['settings.my-apps.create', 'New App'],
            'item' => $item
        ];

        return view('settings::my_apps.form', $data);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'route' => 'required|unique:apps,route'
        ]);

        $inputs = $request->all();
        $my_app = MyApp::create($inputs);

        if($my_app){
            Session::flash('success', 'New app created successfully');
            return redirect(route('settings.my-apps.list'));
        }else{
            Session::flash('error', 'Something went wrong, please try later');
            return redirect()->back();
        }

    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('settings::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        $item = MyApp::find(Crypt::decrypt($id));

        $data = [
            'title' => 'Update App',
            'back_route' => ['settings.my-apps.list', 'Apps List'],
            'new_route' => ['settings.my-apps.create', 'New App'],
            'item' => $item
        ];

        return view('settings::my_apps.form', $data);
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        $id = Crypt::decrypt($id);
        $my_app = MyApp::find($id);

        $this->validate($request, [
            'title' => 'required',
            'route' => 'required|unique:apps,route,'.$id
        ]);

        $inputs = $request->all();

        if($my_app->fill($inputs)->save()){
            Session::flash('success', 'App updated successfully');
            return redirect(route('settings.my-apps.list'));
        }else{
            Session::flash('error', 'Something went wrong, please try later');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        $id = Crypt::decrypt($id);
        $my_app = MyApp::find($id);

        if($my_app->delete()){
            Session::flash('success', 'App deleted successfully');
            return redirect()->back();
        }else{
            Session::flash('error', 'Something went wrong, please try later');
            return redirect()->back();
        }
    }
}
