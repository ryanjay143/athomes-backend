<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PersonalInfoModel extends Model
{
    protected $table = 'p_info';
    protected $primaryKey = 'id';
    protected $fillable = [
        'user_id',
        'first_name',
        'middle_name',
        'last_name',
        'gender',
        'extension_name',
        'phone',
        'email',
        'complete_address',
        'profile_pic'
    ];

    public function identityDetails()
    {
        return $this->belongsTo(IdentityDetailsModel::class);
    }
}
