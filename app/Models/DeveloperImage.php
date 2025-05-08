<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeveloperImage extends Model
{
    protected $table = 'developer_image';
    protected $primaryKey = 'id';
    protected $fillable = [
        'dev_id',
        'image',
    ];
}
