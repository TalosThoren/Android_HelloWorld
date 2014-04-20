package com.helloworld;

import android.app.Activity;
import android.os.Bundle;
import android.os.Build;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.view.MenuItem;
import android.widget.TextView;
import android.support.v4.app.NavUtils;

public class DisplayMessageActivity extends Activity
{
    @SuppressLint( "NewApi" )
    /** Called when the activity is first created. */
    @Override
    public void onCreate( Bundle savedInstanceState )
    {
        super.onCreate( savedInstanceState );

	getActionBar().setDisplayHomeAsUpEnabled( true );

	Intent intent = getIntent();
	String message = intent.getStringExtra( HelloWorld.EXTRA_MESSAGE );

	TextView textView = new TextView( this );
	textView.setTextSize( 40 );
	textView.setText( message );

	setContentView( textView );
    }

    @Override
    public boolean onOptionsItemSelected( MenuItem item )
    {
	switch( item.getItemId() )
	{
	    case android.R.id.home:
		NavUtils.navigateUpFromSameTask( this );
		return true;
	}
	return super.onOptionsItemSelected( item );
    }
}
