package com.oursarbot.sar_bot;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.os.AsyncTask;
import android.os.Handler;
import java.io.InputStream;
import java.io.OutputStream;
import android.app.Activity;
import android.view.View.OnClickListener;

import java.io.IOException;
import java.util.UUID;
//NOT SURE
//mConnectedThread = new ConnectedThread(btSocket);
       // mConnectedThread.start();
        //mConnectedThread.write("x");


public class Control extends AppCompatActivity {

    Button btnFwd, btnBwd, btnLFwd, btnRFwd, btnLBwd, btnRBwd, btnCWR, btnACR,btnNext,  btnDis;
    Switch swManmode, swBrake;
    SeekBar speed;
    TextView sensorView0, sensorView1, sensorView2,sensorView3, sensorView4, txtString, txtStringLength ;

    Handler bluetoothIn;
    final int handlerState = 0;
    private StringBuilder recDataString = new StringBuilder();

    public ConnectedThread mConnectedThread;

    String address = null;
    private ProgressDialog progress;
    BluetoothAdapter myBluetooth = null;
    BluetoothSocket btSocket = null;
    private boolean isBtConnected = false;
    //SPP UUID. Look for it
    static final UUID myUUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");

    @Override
    //changed from protected to public
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        Intent newint = getIntent();
        address = newint.getStringExtra(DeviceList.EXTRA_ADDRESS); //receive the address of the bluetooth device

        //view of the ledControl
        setContentView(R.layout.activity_control);

        //call the widgtes
        btnFwd = (Button)findViewById(R.id.button9);
        btnBwd = (Button)findViewById(R.id.button3);
        btnLFwd = (Button)findViewById(R.id.button2);
        btnRFwd = (Button)findViewById(R.id.button6);
        btnLBwd = (Button)findViewById(R.id.button10);
        btnRBwd = (Button)findViewById(R.id.button8);
        btnCWR = (Button)findViewById(R.id.button13);
        btnACR = (Button)findViewById(R.id.button14);
        btnNext = (Button)findViewById(R.id.button15);
        swManmode = (Switch)findViewById(R.id.switch1);
        swBrake = (Switch)findViewById(R.id.switch2);
        //txtString = (TextView) findViewById(R.id.txtString);
        //txtStringLength = (TextView) findViewById(R.id.testView1);

        //displaying
        sensorView0 = (TextView) findViewById(R.id.textView5);
        sensorView1 = (TextView) findViewById(R.id.textView2);
        sensorView2 = (TextView) findViewById(R.id.textView3);
        sensorView3 = (TextView) findViewById(R.id.textView8);
        sensorView4 = (TextView) findViewById(R.id.textView6);
        btnDis = (Button)findViewById(R.id.button4);
        speed = (SeekBar)findViewById(R.id.seekBar);

        //lumn = (TextView)findViewById(R.id.lumn);

        bluetoothIn = new Handler() {
            @Override
            public void handleMessage(android.os.Message msg) {
                if (msg.what == handlerState) {                                     //if message is what we want
                    //txtString.setText("Data Received = a");
                    String readMessage = (String) msg.obj;                                                 // msg.arg1 = bytes from connect thread
                    recDataString.append(readMessage);                                      //keep appending to string until ~
                    int endOfLineIndex = recDataString.indexOf("~");                    // determine the end-of-line
                    if (endOfLineIndex > 0)
                    {                                           // make sure there data before ~
                        String dataInPrint = recDataString.substring(0, endOfLineIndex);    // extract string
                        //txtString.setText("Data Received = " + dataInPrint);
                        int dataLength = dataInPrint.length();                          //get length of data received
                        //txtStringLength.setText("String Length = " + String.valueOf(dataLength));

                        if (recDataString.charAt(0) == '#')                             //if it starts with # we know it is what we are looking for
                        {
                            String sensor0 = recDataString.substring(1, 6);             //get sensor value from string between indices 1-5
                            String sensor1 = recDataString.substring(6, 11);            //same again...
                            String sensor2 = recDataString.substring(11, 16);
                            String sensor3 = recDataString.substring(16, 21);
                            String sensor4 = recDataString.substring(21, 26);

                            sensorView0.setText("X: " + sensor0);    //update the textviews with sensor values
                            sensorView1.setText("Y: " + sensor1);
                            sensorView2.setText("X: " + sensor2);
                            sensorView3.setText("Y: " + sensor3);
                            sensorView4.setText(sensor4 + " \u00B0C");
                        }
                        recDataString.delete(0, recDataString.length());                    //clear all string data
                        // strIncom =" ";
                        dataInPrint = " ";
                    }
                }
            }
        };

        myBluetooth = BluetoothAdapter.getDefaultAdapter();       // get Bluetooth adapter
        checkBTState();

        //new ConnectBT().execute(); //Call the class to connect

        //commands to be sent to bluetooth

        /*
        btnFwd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveFwd();   //method to reverse
            }
        });
        */

        //btnFwd.setOnClickListener(new View.OnClickListener()
        btnFwd.setOnTouchListener(new View.OnTouchListener() {
                                      @Override
                                      public boolean onTouch(View v, MotionEvent event) {
                                          switch (event.getAction()) {
                                              case MotionEvent.ACTION_DOWN:
                                                  // PRESSED
                                              {
                                                  moveFwd();      //method to forward
                                                  return true;
                                              }// if you want to handle the touch event
                                              case MotionEvent.ACTION_UP:
                                                  // RELEASED
                                              {
                                                  nuller();
                                                  return true;
                                              }// if you want to handle the touch event
                                          }
                                          return false;
                                      }
                                  });

        /*
       btnBwd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveBwd();   //method to reverse
            }
        });
        */


        btnBwd.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveBwd();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });




        /*
        btnLFwd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveLFwd();   //method to turn left forward
            }
        });
        */

        btnLFwd.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveLFwd();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });

        /*
        btnRFwd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveRFwd();   //method to turn right forward
            }
        });
        */

        btnRFwd.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveRFwd();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });


        /*
        btnLBwd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveLBwd();   //method to turn left forward
            }
        });
        */

        btnLBwd.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveLBwd();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });



        /*
        btnRBwd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveRBwd();   //method to turn left reverse
            }
        });
        */

        btnRBwd.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveRBwd();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });



        /*
        btnCWR.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveCWR();   //method to turn clockwise
            }
        });
        */

        btnCWR.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveCWR();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });


        /*
        btnACR.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                moveACR();   //method to turn anticlockwise
            }
        });
        */

        btnDis.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                Disconnect(); //close connection
            }
        });

        btnACR.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        // PRESSED
                    {
                        moveACR();      //method to forward
                        return true;
                    }// if you want to handle the touch event
                    case MotionEvent.ACTION_UP:
                        // RELEASED
                    {
                        nuller();
                        return true;
                    }// if you want to handle the touch event
                }
                return false;
            }
        });



        btnNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {

                // Make an intent to start next activity.
                Intent i = new Intent(Control.this, ImageDisplay.class);

                //Change the activity.

                startActivity(i);;   //next page
            }
        });


        swManmode.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
             if(isChecked) {
                 useManmode();
                 btnFwd.setEnabled(true);
                 btnBwd.setEnabled(true);
                 btnLFwd.setEnabled(true);
                 btnRFwd.setEnabled(true);
                 btnLBwd.setEnabled(true);
                 btnRBwd.setEnabled(true);
                 btnCWR.setEnabled(true);
                 btnACR.setEnabled(true);
                 swBrake.setEnabled(true);


             }else {
                 btnFwd.setEnabled(false);
                 btnBwd.setEnabled(false);
                 btnLFwd.setEnabled(false);
                 btnRFwd.setEnabled(false);
                 btnLBwd.setEnabled(false);
                 btnRBwd.setEnabled(false);
                 btnCWR.setEnabled(false);
                 btnACR.setEnabled(false);
                 swBrake.setEnabled(false);
                 useAutomode();
             }

            }
        });


        swBrake.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked) {
                    useBrake();

                }else {

                    useNobrake();
                }

            }
        });

        speed.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser==true)
                {
                    String P = String.valueOf(progress);
                    //lumn.setText(String.valueOf(progress));
                    try
                    {
                        btSocket.getOutputStream().write((P+P+P+P+P+P+P+P+P+P+P+P+P+P+P+P).getBytes());
                    }
                    catch (IOException e)
                    {

                    }
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });
    }



    private BluetoothSocket createBluetoothSocket(BluetoothDevice device) throws IOException {

        return  device.createRfcommSocketToServiceRecord(myUUID);
        //creates secure outgoing connecetion with BT device using UUID
    }

    @Override
    public void onResume() {
        super.onResume();

        //Get MAC address from DeviceListActivity via intent
        Intent intent = getIntent();

        //Get the MAC address from the DeviceListActivty via EXTRA
        address = intent.getStringExtra(DeviceList.EXTRA_ADDRESS);

        //create device and set the MAC address
        BluetoothDevice device = myBluetooth.getRemoteDevice(address);

        try {
            btSocket = createBluetoothSocket(device);
        } catch (IOException e) {
            Toast.makeText(getBaseContext(), "Socket creation failed", Toast.LENGTH_LONG).show();
        }
        // Establish the Bluetooth socket connection.
        try
        {
            btSocket.connect();
        } catch (IOException e) {
            try
            {
                btSocket.close();
            } catch (IOException e2)
            {
                //insert code to deal with this
            }
        }
        mConnectedThread = new ConnectedThread(btSocket);
        mConnectedThread.start();

        //I send a character when resuming.beginning transmission to check device is connected
        //If it is not an exception will be thrown in the write method and finish() will be called
        mConnectedThread.write("x");
    }

    @Override
    public void onPause()
    {
        super.onPause();
        try
        {
            //Don't leave Bluetooth sockets open when leaving activity
            btSocket.close();
        } catch (IOException e2) {
            //insert code to deal with this
        }
    }

    //Checks that the Android device Bluetooth is available and prompts to be turned on if off
    private void checkBTState() {

        if(myBluetooth==null) {
            Toast.makeText(getBaseContext(), "Device does not support bluetooth", Toast.LENGTH_LONG).show();
        } else {
            if (myBluetooth.isEnabled()) {
            } else {
                Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                startActivityForResult(enableBtIntent, 1);
            }
        }
    }










    private void Disconnect()
    {
        if (btSocket!=null) //If the btSocket is busy
        {
            try
            {
                btSocket.close(); //close connection
            }
            catch (IOException e)
            { msg("Error");}
        }
        finish(); //return to the first layout

    }

    private void moveBwd()
    {
        if (btSocket!=null)
        {
            try
            {
                //btSocket.getOutputStream().write('b');
                btSocket.getOutputStream().write("bbbbbbbbbbbbbbbb".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }

    private void moveFwd()
    {
        if (btSocket!=null)
        {
            try
            {
                //btSocket.getOutputStream().write('f');
                btSocket.getOutputStream().write("ffffffffffffffff".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }

    private void nuller()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("oooooooooooooooo".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }

    private void moveLFwd()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("iiiiiiiiiiiiiiii".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }


    private void moveRFwd()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("jjjjjjjjjjjjjjjj".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }


    private void moveLBwd()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("kkkkkkkkkkkkkkkk".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }

    private void moveRBwd()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("tttttttttttttttt".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }


    private void moveCWR()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("pppppppppppppppp".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }


    private void moveACR()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("nnnnnnnnnnnnnnnn".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }

    private void useManmode()
    {
        if (btSocket!=null)
        {
            try
            {
                //btSocket.getOutputStream().write('m');
                btSocket.getOutputStream().write("mmmmmmmmmmmmmmmm".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }


    private void useAutomode()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write('a');
                btSocket.getOutputStream().write("aaaaaaaaaaaaaaaa".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }


    private void useBrake()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("vvvvvvvvvvvvvvvv".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }

    private void useNobrake()
    {
        if (btSocket!=null)
        {
            try
            {
                btSocket.getOutputStream().write("wwwwwwwwwwwwwwww".toString().getBytes());
            }
            catch (IOException e)
            {
                msg("Error");
            }
        }
    }



    // fast way to call Toast
    private void msg(String s)
    {
        Toast.makeText(getApplicationContext(),s,Toast.LENGTH_LONG).show();
    }








/*
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_led_control, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }*/




/*

    private class ConnectBT extends AsyncTask<Void, Void, Void>  // UI thread
    {
        private boolean ConnectSuccess = true; //if it's here, it's almost connected

        @Override
        protected void onPreExecute()
        {
            progress = ProgressDialog.show(Control.this, "Connecting...", "Please wait!!!");  //show a progress dialog
        }

        @Override
        protected Void doInBackground(Void... devices) //while the progress dialog is shown, the connection is done in background
        {
            try
            {
                if (btSocket == null || !isBtConnected)
                {
                    myBluetooth = BluetoothAdapter.getDefaultAdapter();//get the mobile bluetooth device
                    BluetoothDevice dispositivo = myBluetooth.getRemoteDevice(address);//connects to the device's address and checks if it's available
                    btSocket = dispositivo.createInsecureRfcommSocketToServiceRecord(myUUID);//create a RFCOMM (SPP) connection
                    BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                    btSocket.connect();//start connection



                }
            }
            catch (IOException e)
            {
                ConnectSuccess = false;//if the try failed, you can check the exception here
            }
            return null;
        }
        @Override
        protected void onPostExecute(Void result) //after the doInBackground, it checks if everything went fine
        {
            super.onPostExecute(result);

            if (!ConnectSuccess)
            {
                msg("Connection Failed. Is it a SPP Bluetooth? Try again.");
                finish();
            }
            else
            {
                msg("Connected.");
                isBtConnected = true;
            }
            progress.dismiss();
        }
    }

*/

//create new class for data transfer i guess
private class ConnectedThread extends Thread {
    //private final BluetoothSocket connectedBluetoothSocket;
    private final InputStream mmInStream;
    private final OutputStream mmOutStream;

    //creation of the connect thread
    public ConnectedThread(BluetoothSocket socket) {
       // connectedBluetoothSocket = socket;
        InputStream tmpIn = null;
        OutputStream tmpOut = null;

        try {
            //Create I/O streams for connection
            tmpIn = socket.getInputStream();
            tmpOut = socket.getOutputStream();
        } catch (IOException e) { }

        mmInStream = tmpIn;
        mmOutStream = tmpOut;
    }

    public void run() {
        byte[] buffer = new byte[256];
        int bytes;

        // Keep looping to listen for received messages
        while (true) {
            try {
                bytes = mmInStream.read(buffer);            //read bytes from input buffer
                String readMessage = new String(buffer, 0, bytes);
                // Send the obtained bytes to the UI Activity via handler
                bluetoothIn.obtainMessage(handlerState, bytes, -1, readMessage).sendToTarget();
            } catch (IOException e) {
                break;
            }
        }
    }
    //write method
    public void write(String input) {
        byte[] msgBuffer = input.getBytes();           //converts entered String into bytes
        try {
            mmOutStream.write(msgBuffer);                //write bytes over BT connection via outstream
        } catch (IOException e) {
            //if you cannot write, close the application
            Toast.makeText(getBaseContext(), "Connection Failure", Toast.LENGTH_LONG).show();
            finish();

        }
    }

    /*public void cancel() {
        try {
            connectedBluetoothSocket.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }*/
}

}