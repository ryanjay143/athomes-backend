<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IdentityDetailsModel extends Model
{
    protected $table = 'identity_details';
    protected $primaryKey = 'id';
    protected $fillable = [
        'user_id',
        'prc_liscence_number',
        'dhsud_registration_number',
        'validation_date',
        'last_school_att'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function personalInfo()
    {
        return $this->belongsTo(PersonalInfoModel::class, 'user_id', 'user_id');
    }

    public function salesEncoding()
    {
        return $this->belongsTo(SakesEncodingModel::class, 'agent_id');
    }
}
