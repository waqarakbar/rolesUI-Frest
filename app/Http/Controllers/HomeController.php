<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = Auth::user();
        $user_role_ids = [0];
        foreach($user->roles as $ur){
            $user_role_ids[] = $ur->id;
        }

        $apps_sql = "SELECT
                    a.id, a.title, a.icon, a.route
                    FROM apps as a
                    JOIN menus as m on a.id = m.app_id
                    JOIN permissions as p on m.id = p.menu_id
                    WHERE
                    p.id in (SELECT permission_id FROM permission_role WHERE role_id in (".implode(",", $user_role_ids)."))
                    OR p.id in (SELECT permission_id FROM permission_user WHERE user_id in (".$user->id."))
                    and a.deleted_at is NULL
                    and m.deleted_at is NULL
                    and p.deleted_at is NULL
                    GROUP BY a.id";

        $apps = DB::select($apps_sql);

        $data = [
            'user' => $user,
            'apps' => $apps
        ];

        return view('layouts.landing_screen_frest', $data);
    }
}
