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
    Route::get('/', 'VmsController@index');


    // Visitor Crud
    Route::resource('visitors', VisitorController::class);

    
    Route::group(['prefix' => 'visitor-managment'], function () {


        Route::get('visitor/print/{id}', [VisitorController::class, 'print'])->name('visitor.print');
        Route::get('visitor/epass', [VisitorController::class, 'epass'])->name('visitor.epass');
        Route::get('visitor/info/{id}', [VisitorController::class, 'info'])->name('visitor.info');

        Route::post('request/{id}', [VisitorController::class, 'requpdate'])->name('visitor.info.update');

        Route::get('visitor/epass/update', [VisitorController::class, 'epass_update'])->name('epass.visitors.update');
    });
    Route::group(['prefix' => 'reports'], function () {
        Route::get('visitors', [ReportController::class, 'visitors'])->name('reports.visitors');
    });

    Route::group(['prefix' => 'Visitor'], function () {

        Route::resource('visit', VisitRequestController::class);
        Route::get('print/{id}', [VisitRequestController::class, 'print'])->name('visit.print');
    });
});
