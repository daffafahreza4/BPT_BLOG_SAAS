<?php

// app/Models/UpgradeProof.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UpgradeProof extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'membership_id',
        'proof_image',
        'status',
    ];

    // Optionally define relationships if needed
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function membership()
    {
        return $this->belongsTo(Membership::class);
    }
}

