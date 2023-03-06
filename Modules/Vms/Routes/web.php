<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::prefix('vms')->group(function () {


    //Vistior Registration and Login 
    Route::get('visitor/register', 'VmsController@register')->name('vms.visitor.register');


    Route::middleware(['auth'])->group(function () {
        // Visitor Crud
        Route::get('/', 'VmsController@index');
        Route::resource('visitors', VisitorController::class);
        Route::get('visitor/print/{id}', 'VisitorController@print')->name('visitor.print');
        Route::get('visitor/epass', 'VisitorController@epass')->name('visitor.epass');
        Route::get('visitor/info/{id}', 'VisitorController@info')->name('visitor.info');
        Route::get('visitor/epass/update', 'VisitorController@epass_update')->name('epass.visitors.update');
        Route::post('request/{id}', 'VisitorController@requpdate')->name('visitor.info.update');
        // Report Controller 
        Route::group(['prefix' => 'reports'], function () {
            Route::get('visitors', 'ReportController@visitors')->name('reports.visitors');
        });


        Route::group(['prefix' => 'Visitor'], function () {
            Route::resource('visit', VisitRequestController::class);
            Route::get('print/{id}', [VisitRequestController::class, 'print'])->name('visit.print');
        });
    });




    // visitor account and its routes 
    Route::group(['namespace' => 'Auth'], function () {
        Route::get('register', 'RegisterController@showRegistrationForm')->name('visitor.signup');
        //  Route::get('login', 'LoginController@showLoginForm')->name('visitor.auth');
        Route::get('login', [LoginController::class, 'showLoginForm'])->name('visitor.auth');

        Route::get('login/email', 'LoginController@showLoginForm')->name('visitor.auth.email');
        Route::post('login/email', 'LoginController@before_login')->name('visitor.auth.postemail');
        Route::post('login/email/password', 'LoginController@login')->name('visitor.auth.postemailpassword');

        Route::post('visitor/logout', 'Auth\LoginController@logout')->name('visitor.auth.logout');
    });
    // visitor account and its routes 
    Route::group(['namespace' => '\Auth', 'prefix' => 'visitorauth'], function () {



        //  Route::get('login', 'LoginController@showLoginForm')->name('visitor.auth');
        Route::get('login', [LoginController::class, 'showLoginForm'])->name('visitor.auth');

        Route::post('register', 'RegisterController@register')->name('visitor.register');
        Route::get('login/email', 'LoginController@showLoginForm')->name('visitor.auth.email');
        Route::post('login/email', 'LoginController@before_login')->name('visitor.auth.postemail');
        Route::post('login/email/password', 'LoginController@login')->name('visitor.auth.postemailpassword');

        Route::post('visitor/logout', 'Auth\LoginController@logout')->name('visitor.auth.logout');
    });
    // visitor account and its routes 
    Route::group(['namespace' => '\Auth', 'prefix' => 'visitorauth'], function () {


        Route::get('signup', 'RegisterController@showRegistrationForm')->name('visitor.signup');
        //  Route::get('login', 'LoginController@showLoginForm')->name('visitor.auth');
        Route::get('login', [LoginController::class, 'showLoginForm'])->name('visitor.auth');

        Route::post('register', 'RegisterController@register')->name('visitor.register');
        Route::get('login/email', 'LoginController@showLoginForm')->name('visitor.auth.email');
        Route::post('login/email', 'LoginController@before_login')->name('visitor.auth.postemail');
        Route::post('login/email/password', 'LoginController@login')->name('visitor.auth.postemailpassword');

        Route::post('visitor/logout', 'Auth\LoginController@logout')->name('visitor.auth.logout');
    });
});
