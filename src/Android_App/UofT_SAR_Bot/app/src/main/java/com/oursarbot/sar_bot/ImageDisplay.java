package com.oursarbot.sar_bot;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ImageDisplay extends AppCompatActivity {

    Button btnPrev;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_image_display);

        btnPrev = (Button)findViewById(R.id.button7);



        btnPrev.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                finish();
            }
        });
    }
}
