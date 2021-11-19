/*
 * Copyright (c) 2018 Matt Harris
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Matt Harris <matth281@outlook.com>
 *              Allie Law <allie@cloverleaf.app>
 */

public class EasyDocs : Gtk.Application {
    public static GLib.Settings settings;
    static construct {
        settings = new GLib.Settings ("com.github.watsonprojects.easydocs");
    }

    public EasyDocs () {
        Object (application_id: "com.github.watsonprojects.easydocs",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    public override void activate () {
        var window = new MainWindow (this);

        var quit_action = new SimpleAction ("quit", null);
        add_action (quit_action);
        set_accels_for_action ("app.quit", {"<Control>q"});

        quit_action.activate.connect (() => {
            window.destroy ();
        });

        var tab_switch = new SimpleAction ("switch", null);
        add_action (tab_switch);
        set_accels_for_action ("app.switch", {"<Control>Tab"});

        tab_switch.activate.connect (() => {
            window.change_tab ();
        });

        var search_action = new SimpleAction ("find", null);
        add_action (search_action);
        set_accels_for_action ("app.find", {"<Control>F"});

        search_action.activate.connect (window.toggle_search);

        // First we get the default instances for Granite.Settings and Gtk.Settings
        var granite_settings = Granite.Settings.get_default ();
        var gtk_settings = Gtk.Settings.get_default ();

        // Then, we check if the user's preference is for the dark style and set it if it is
        gtk_settings.gtk_application_prefer_dark_theme = granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK;

        // Finally, we listen to changes in Granite.Settings and update our app if the user changes their preference
        granite_settings.notify["prefers-color-scheme"].connect (() => {
            gtk_settings.gtk_application_prefer_dark_theme = granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK;
            //  No need to update devdocs, it is set to follow the system theme
        });
    }

    public static int main (string[] args) {
        var app = new EasyDocs ();
        return app.run (args);
    }
}
