<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectDetailsModel extends Model
{
    protected $table = 'project_details';
    protected $primaryKey = 'id';
    protected $fillable = [
        'project_name',
        'project_location',
        'project_contact_person',
    ];

    public function developer()
{
    return $this->belongsTo(DeveloperModel::class, 'developer_id');
}
}
