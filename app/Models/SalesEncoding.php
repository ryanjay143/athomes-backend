<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesEncoding extends Model
{
    
    protected $table = 'sales_encodings';
    protected $primaryKey = 'id';
    protected $fillable = [
        'agent_id',
        'client_name',
        'category',
        'amount',
        'location',
        'date_on_sale',
        'remarks',
        'image',
        'block_and_lot'
    ];

    
    
    public function agent()
    {
        return $this->hasOne(IdentityDetailsModel::class, 'id', 'agent_id');
    }
}
