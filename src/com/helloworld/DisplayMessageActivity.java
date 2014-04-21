// Package statement
package com.helloworld;

// Imports from android.os
import android.os.Bundle;
import android.os.Build;

// Imports from android.app
import android.app.Activity;

// Imports from android.content
import android.content.Intent;

// Imports from android.view
import android.view.MenuItem;

// Imports from android.widget
import android.widget.TextView;

// Imports from android.support.v4
import android.support.v4.app.NavUtils;

// Imports from android.support.v7
import android.support.v7.app.ActionBarActivity;

public class DisplayMessageActivity extends ActionBarActivity
{
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

	/** <code>onOptionsItemSelected</code>.
	 * @param item	Android MenuItem object.
	 */
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
