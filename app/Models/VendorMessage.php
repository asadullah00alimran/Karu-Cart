<?php

namespace App\Models;

use App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VendorMessage extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'user_id',
        'product_id',
        'vendor_id',
        'message',
        'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function vendor()
    {
        return $this->belongsTo(User::class);
    }
}
