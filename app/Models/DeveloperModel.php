<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeveloperModel extends Model
{
    protected $table = 'developer';
    protected $primaryKey = 'id';
    protected $fillable = [
        'dev_name',
        'dev_email',
        'dev_phone',
        'dev_location',
        'image',
    ];

    public function projects()
    {
        return $this->hasMany(ProjectDetailsModel::class, 'developer_id');
    }
}
