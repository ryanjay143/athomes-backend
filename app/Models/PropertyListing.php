<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PropertyListing extends Model
{
    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
    protected $table = 'property_listings';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category',
        'date_listed',
        'lot_area',
        'floor_area',
        'details',
        'location',
        'type_of_listing',
        'status'
    ];

    public function propertyImages()
    {
        return $this->hasMany(PropertyImages::class, 'property_id', 'id');
    }
}