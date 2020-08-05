package com.flutter.dawn.flutter_dawn_app;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_acitvity);
    }
    public void onClick(View v){
        startActivity(new Intent(this,MainActivity.class));
        finish();

    }
}