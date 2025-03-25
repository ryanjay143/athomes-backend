<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeveloperModel extends Model
{
    protected $table = 'products';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'description',
        'price',
    ];
}
