<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\DeveloperModel; 

class ImageUploadController extends Controller
{
    public function upload(Request $request)
    {
        $request->validate([
            'image' => 'required|file|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Store the image in the 'public/images' directory
        $path = $request->file('image')->store('images', 'public');

        // Save the image path to the database
        $image = new DeveloperModel();
        $image->dev_id = $request->input('dev_id'); // Assuming you have a dev_id in the request
        $image->image = $path;
        $image->save();

        return response()->json([
            'message' => 'Image uploaded successfully',
            'filePath' => Storage::url($path),
        ], 201);
    }

}
