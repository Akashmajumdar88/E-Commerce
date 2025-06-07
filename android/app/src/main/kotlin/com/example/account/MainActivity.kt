package com.example.account

//import io.flutter.embedding.android.FlutterActivity
//
//class MainActivity: FlutterActivity()
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "device_control"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "lockDevice" -> {
                    lockDevice()
                    result.success("Device Locked")
                }
                "unlockDevice" -> {
                    unlockDevice()
                    result.success("Device Unlocked")
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun lockDevice() {
        val devicePolicyManager = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val componentName = ComponentName(this, AdminReceiver::class.java)

        if (devicePolicyManager.isAdminActive(componentName)) {
            devicePolicyManager.lockNow()
        }
    }

    private fun unlockDevice() {
        // Unlocking the device automatically is not possible for security reasons.
        // However, we can disable restrictions or show an unlock message.
    }
}
