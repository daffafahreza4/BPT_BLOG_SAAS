<?php

// database/migrations/xxxx_xx_xx_xxxxxx_drop_upgrade_proofs_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropUpgradeProofsTable extends Migration
{
    public function up()
    {
        Schema::dropIfExists('upgrade_proofs');
    }

    public function down()
    {
        // Create the table again if needed
        Schema::create('upgrade_proofs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('membership_id')->constrained()->onDelete('cascade');
            $table->string('proof_image');
            $table->enum('status', ['pending', 'approved', 'canceled'])->default('pending');
            $table->timestamps();
        });
    }
}
