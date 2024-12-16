package com.undostres_playground.undostres_playground

import android.os.Bundle
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.deferredcomponents.PlayStoreDeferredComponentManager


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        val deferredComponentManager = PlayStoreDeferredComponentManager(this, null)
        FlutterInjector.setInstance(FlutterInjector.Builder().setDeferredComponentManager(deferredComponentManager).build())
        super.onCreate(savedInstanceState)
    }
}
