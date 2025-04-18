<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PropertyImages extends Model
{
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['property_id', 'images'];

    public function propertyListing()
    {
        return $this->belongsTo(PropertyListing::class, 'property_id', 'id');
    }

    public function propertyImages()
    {
        return $this->hasMany(PropertyImages::class, 'property_id', 'id');
    }
}