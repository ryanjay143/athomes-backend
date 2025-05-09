<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectDetailsModel extends Model
{
    protected $table = 'project_details';
    protected $primaryKey = 'id';
    protected $fillable = [
        'developer_id',
        'project_name',
        'project_location',
        'project_category',
        'status',
        'total_units',
        'available_units',
    ];

    public function developer()
{
    return $this->belongsTo(DeveloperModel::class, 'developer_id');
}
}
