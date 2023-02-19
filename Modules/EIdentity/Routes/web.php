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

Route::prefix('eidentity')->group(function() {
    Route::prefix('employee')->group(function (){
        Route::get('/', 'EIdentityController@index')->name('eidentity.employee.dashboard');
        Route::get('/list', 'EIdentityController@list')->name('eidentity.employee.list');
        Route::get('/new', 'EIdentityController@list')->name('eidentity.employee.create');
        Route::get('/edit', 'EIdentityController@list')->name('eidentity.employee.edit');

        Route::post('/delete', 'EIdentityController@list')->name('eidentity.employee.delete');
    });
});
