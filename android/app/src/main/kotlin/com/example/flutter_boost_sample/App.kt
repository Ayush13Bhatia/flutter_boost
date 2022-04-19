package com.example.flutter_boost_sample

import android.app.Application
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostDelegate
import io.flutter.embedding.engine.FlutterEngine

class App : Application() {

    override fun onCreate() {
        super.onCreate()

        FlutterBoost.instance().setup(this, object: FlutterBoostDelegate{
            override fun pushNativeRoute(pageName: String?, arguments: MutableMap<String, Any>?) {
                TODO("Not yet implemented")
            }

            override fun pushFlutterRoute(
                pageName: String?,
                uniqueId: String?,
                arguments: MutableMap<String, Any>?
            ) {
                TODO("Not yet implemented")
            }

        }) { engine ->

        }
    }
}