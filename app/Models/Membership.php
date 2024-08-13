<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Membership extends Model
{
    use HasFactory;
    protected $fillable = [
        'role',
        'price',
        'feature',
    ];

    // app/Models/Membership.php
    public function upgradeProofs()
    {
        return $this->hasMany(UpgradeProof::class);
    }

}
