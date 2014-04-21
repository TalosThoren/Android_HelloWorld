// Package statement
package com.helloworld;

// Imports from android.os
import android.os.Bundle;

// Imports from android.app
import android.app.Activity;

// Imports from android.view
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MenuInflater;

// Imports from android.content
import android.content.Intent;

// Imports from android.widget
import android.widget.EditText;

// Imports from android.support.v7
import android.support.v7.app.ActionBarActivity;

public class HelloWorld extends ActionBarActivity
{
    public final static String EXTRA_MESSAGE = "com.helloworld.MESSAGE";

    /** Called when the activity is first created. */
    @Override
    public void onCreate( Bundle savedInstanceState )
    {
        super.onCreate( savedInstanceState );
        setContentView( R.layout.main );
    }

	/** <code>sendMessage</code>.
	 * @param view	Android View object.
	 */
    public void sendMessage( View view )
    {
		Intent intent = new Intent( this, DisplayMessageActivity.class );
		EditText editText = (EditText)findViewById( R.id.edit_message );
		String message = editText.getText().toString();
		intent.putExtra( EXTRA_MESSAGE, message );
		startActivity( intent );
    }

	/** <code>onCreateOptionsMenu</code>.
	 * @param menu	Android Menu object.
	 */
    @Override
    public boolean onCreateOptionsMenu( Menu menu )
    {
		// Inflate the menu items for use in the action bar
		MenuInflater inflater = getMenuInflater();
		inflater.inflate( R.menu.main_activity_actions, menu );
		return super.onCreateOptionsMenu( menu );
    }

	/** <code>onOptionsItemSelected</code>.
	 * @param item	Android MenuItem object.
	 */
    @Override
    public boolean onOptionsItemSelected( MenuItem item )
    {
		switch( item.getItemId() )
		{
			case R.id.action_search:
			//openSearch();
			return true;
			case R.id.action_settings:
			//openSettings();
			return true;
			default:
			return super.onOptionsItemSelected( item );
		}
    }
}
