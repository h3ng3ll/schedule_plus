package com.example.schedule_plus

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import  es.antonborri.home_widget.HomeWidgetPlugin
/**
 * Implementation of App Widget functionality.
 */
class TodaySchedule : AppWidgetProvider() {


    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        // There may be multiple widgets active, so update all of them
        for (appWidgetId in appWidgetIds) {

            /// get data from flutter app
            val widgetData  = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName , R.layout.today_schedule).apply{
                val courseName = widgetData.getString("course_name" , null)
                val todayDay = widgetData.getString("today_day" , null)
                val beginTime = widgetData.getString("begin_time" , null)
                val endTime = widgetData.getString("end_time" , null)
                val professor = widgetData.getString("professor" , null)
                val location = widgetData.getString("location" , null)

                setTextViewText(R.id.course_name , courseName ?: "No text")
                setTextViewText(R.id.todayDay , todayDay ?: "today")
                setTextViewText(R.id.timeRange , "$beginTime - $endTime")
                setTextViewText(R.id.professor , professor)
                setTextViewText(R.id.location , location)
            }

//                updateAppWidget(context, appWidgetManager, appWidgetId)
            appWidgetManager.updateAppWidget(appWidgetId , views)
        }
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}

internal fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: Int) {
    val widgetText = context.getString(R.string.appwidget_text)
    // Construct the RemoteViews object
    val views = RemoteViews(context.packageName, R.layout.today_schedule)
    views.setTextViewText(R.id.course_name, widgetText)

    // Instruct the widget manager to update the widget
    appWidgetManager.updateAppWidget(appWidgetId, views)
}