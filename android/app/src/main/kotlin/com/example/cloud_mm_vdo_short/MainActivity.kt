package com.example.cloud_mm_vdo_short


import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.widget.Toast

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    private var value: Int = 240

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // Note: this method is invoked on the main thread.
                call, result ->

            when(call.method) {
               "getUpButton"->  result.success(upButton())
                "getDownButton"-> result.success(downButton())
                else ->  result.notImplemented()
            }
          /*  if (call.method == "getUpButton") {
                ///  val batteryLevel = getBatteryLevel()
                // getBatteryLevel

                result.success(upButton())
            }

            else {
                println("got error")
                result.notImplemented()
            }*/
        }

    }



    private fun upButton(): Int {

        println("value")
        return value++;
    }

    private fun downButton(): Int {

        println(value)
        return value--;
    }


}