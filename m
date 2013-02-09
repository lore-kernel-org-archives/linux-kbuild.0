Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35025 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932276Ab3BIA6Q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Feb 2013 19:58:16 -0500
Received: by mail-wi0-f171.google.com with SMTP id hn17so1502828wib.10
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Feb 2013 16:58:14 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/2] kconfig: nconf: rewrite help texts
Date: Sat,  9 Feb 2013 01:58:06 +0100
Message-Id: <0b61650044e9044d3843047fe015fc0ea7943430.1360371247.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1360371247.git.yann.morin.1998@free.fr>
References: <cover.1360371247.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1360371247.git.yann.morin.1998@free.fr>
References: <cover.1360371247.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Roland Eggner <edvx1@systemanalysen.net>, Dmitry Voytik <dvv.kernel@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Roland Eggner <edvx1@systemanalysen.net>

>From: Roland Eggner <edvx1@systemanalysen.net>

Rewrite all help texts.  During several years lazy (incomplete) updates have
left behind a rather thick layer of dust.  Intentions:
(1)  Global help called by <F1> should document all  _currently_  implemented
     keybindings.
(2)  Different help texts called by <F3> resp. <F8><F1> should be consistent
     with (1) and with implementation:
     •  on plain menu entry
     •  in radiolist window
     •  in input windows for text, decimal or hexadecimal values
     •  in filename selection windows <F6> <F7>
     •  SymSearch specific help called by <F8> followed by <F1>
(3)  More reasonable window titles:
     Rename window title            s/README/Global help/
     Rename variable    s/nconf_readme/nconf_global_help/
     Rename window title       s/Instructions/Short help/
(4)  Consider which hints are most useful for first-time-users.

Signed-off-by: Roland Eggner <edvx1@systemanalysen.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998@free.fr: a few additional fixes]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/nconf.c |  348 +++++++++++++++++++++++------------------------
 1 files changed, 170 insertions(+), 178 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index ce93e87..65c672c 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -13,210 +13,202 @@
 #include "nconf.h"
 #include <ctype.h>
 
-static const char nconf_readme[] = N_(
-"Overview\n"
-"--------\n"
-"This interface let you select features and parameters for the build.\n"
-"Features can either be built-in, modularized, or ignored. Parameters\n"
-"must be entered in as decimal or hexadecimal numbers or text.\n"
+static const char nconf_global_help[] = N_(
+"Help windows\n"
+"------------\n"
+"o  Global help:  Unless in a data entry window, pressing <F1> will give \n"
+"   you the global help window, which you are just reading.\n"
 "\n"
-"Menu items beginning with following braces represent features that\n"
-"  [ ] can be built in or removed\n"
-"  < > can be built in, modularized or removed\n"
-"  { } can be built in or modularized (selected by other feature)\n"
-"  - - are selected by other feature,\n"
-"  XXX cannot be selected. Use Symbol Info to find out why,\n"
-"while *, M or whitespace inside braces means to build in, build as\n"
-"a module or to exclude the feature respectively.\n"
+"o  A short version of the global help is available by pressing <F3>.\n"
 "\n"
-"To change any of these features, highlight it with the cursor\n"
-"keys and press <Y> to build it in, <M> to make it a module or\n"
-"<N> to removed it.  You may also press the <Space Bar> to cycle\n"
-"through the available options (ie. Y->N->M->Y).\n"
+"o  Local help:  To get help related to the current menu entry, use any\n"
+"   of <?> <h>, or if in a data entry window then press <F1>.\n"
 "\n"
-"Some additional keyboard hints:\n"
 "\n"
-"Menus\n"
-"----------\n"
-"o  Use the Up/Down arrow keys (cursor keys) to highlight the item\n"
-"   you wish to change use <Enter> or <Space>. Goto submenu by \n"
-"   pressing <Enter> of <right-arrow>. Use <Esc> or <left-arrow> to go back.\n"
-"   Submenus are designated by \"--->\".\n"
-"\n"
-"   Searching: pressing '/' triggers interactive search mode.\n"
-"              nconfig performs a case insensitive search for the string\n"
-"              in the menu prompts (no regex support).\n"
-"              Pressing the up/down keys highlights the previous/next\n"
-"              matching item. Backspace removes one character from the\n"
-"              match string. Pressing either '/' again or ESC exits\n"
-"              search mode. All other keys behave normally.\n"
+"Menu entries\n"
+"------------\n"
+"This interface lets you select features and parameters for the kernel\n"
+"build.  Kernel features can either be built-in, modularized, or removed.\n"
+"Parameters must be entered as text or decimal or hexadecimal numbers.\n"
 "\n"
-"   You may also use the <PAGE UP> and <PAGE DOWN> keys to scroll\n"
-"   unseen options into view.\n"
+"Menu entries beginning with following braces represent features that\n"
+"  [ ]  can be built in or removed\n"
+"  < >  can be built in, modularized or removed\n"
+"  { }  can be built in or modularized, are selected by another feature\n"
+"  - -  are selected by another feature\n"
+"  XXX  cannot be selected.  Symbol Info <F2> tells you why.\n"
+"*, M or whitespace inside braces means to build in, build as a module\n"
+"or to exclude the feature respectively.\n"
 "\n"
-"o  To exit a menu use the just press <ESC> <F5> <F8> or <left-arrow>.\n"
+"To change any of these features, highlight it with the movement keys\n"
+"listed below and press <y> to build it in, <m> to make it a module or\n"
+"<n> to remove it.  You may press the <Space> key to cycle through the\n"
+"available options.\n"
 "\n"
-"o  To get help with an item, press <F1>\n"
-"   Shortcut: Press <h> or <?>.\n"
+"A trailing \"--->\" designates a submenu.\n"
 "\n"
 "\n"
-"Radiolists  (Choice lists)\n"
-"-----------\n"
-"o  Use the cursor keys to select the option you wish to set and press\n"
-"   <S> or the <SPACE BAR>.\n"
+"Menu navigation keys\n"
+"----------------------------------------------------------------------\n"
+"Linewise up                 <Up>\n"
+"Linewise down               <Down>\n"
+"Pagewise up                 <Page Up>\n"
+"Pagewise down               <Page Down>\n"
+"First entry                 <Home>\n"
+"Last entry                  <End>\n"
+"Enter a submenu             <Right>  <Enter>\n"
+"Go back to parent menu      <Left>   <Esc>  <F5>\n"
+"Close a help window         <Enter>  <Esc>  <F5>\n"
+"Close entry window, apply   <Enter>\n"
+"Close entry window, forget  <Esc>  <F5>\n"
+"Start incremental, case-insensitive search for STRING in menu entries,\n"
+"    no regex support, STRING is displayed in upper left corner\n"
+"                            </>STRING\n"
+"    Remove last character   <Backspace>\n"
+"    Jump to next hit        <Down>\n"
+"    Jump to previous hit    <Up>\n"
+"Exit menu search mode       </>  <Esc>\n"
+"Search for configuration variables with or without leading CONFIG_\n"
+"                            <F8>RegExpr<Enter>\n"
+"Verbose search help         <F8><F1>\n"
+"----------------------------------------------------------------------\n"
 "\n"
-"   Shortcut: Press the first letter of the option you wish to set then\n"
-"             press <S> or <SPACE BAR>.\n"
+"Unless in a data entry window, key <1> may be used instead of <F1>,\n"
+"<2> instead of <F2>, etc.\n"
 "\n"
-"o  To see available help for the item, press <F1>\n"
-"   Shortcut: Press <H> or <?>.\n"
 "\n"
+"Radiolist (Choice list)\n"
+"-----------------------\n"
+"Use the movement keys listed above to select the option you wish to set\n"
+"and press <Space>.\n"
 "\n"
-"Data Entry\n"
-"-----------\n"
-"o  Enter the requested information and press <ENTER>\n"
-"   If you are entering hexadecimal values, it is not necessary to\n"
-"   add the '0x' prefix to the entry.\n"
 "\n"
-"o  For help, press <F1>.\n"
+"Data entry\n"
+"----------\n"
+"Enter the requested information and press <Enter>.  Hexadecimal values\n"
+"may be entered without the \"0x\" prefix.\n"
 "\n"
 "\n"
-"Text Box    (Help Window)\n"
-"--------\n"
-"o  Use the cursor keys to scroll up/down/left/right.  The VI editor\n"
-"   keys h,j,k,l function here as do <u>, <d> and <SPACE BAR> for\n"
-"   those who are familiar with less and lynx.\n"
+"Text Box (Help Window)\n"
+"----------------------\n"
+"Use movement keys as listed in table above.\n"
 "\n"
-"o  Press <Enter>, <F1>, <F5>, <F9>, <q> or <Esc> to exit.\n"
+"Press any of <Enter> <Esc> <q> <F5> <F9> to exit.\n"
 "\n"
 "\n"
-"Alternate Configuration Files\n"
+"Alternate configuration files\n"
 "-----------------------------\n"
-"nconfig supports the use of alternate configuration files for\n"
-"those who, for various reasons, find it necessary to switch\n"
-"between different configurations.\n"
+"nconfig supports switching between different configurations.\n"
+"Press <F6> to save your current configuration.  Press <F7> and enter\n"
+"a file name to load a previously saved configuration.\n"
 "\n"
-"At the end of the main menu you will find two options.  One is\n"
-"for saving the current configuration to a file of your choosing.\n"
-"The other option is for loading a previously saved alternate\n"
-"configuration.\n"
 "\n"
-"Even if you don't use alternate configuration files, but you\n"
-"find during a nconfig session that you have completely messed\n"
-"up your settings, you may use the \"Load Alternate...\" option to\n"
-"restore your previously saved settings from \".config\" without\n"
-"restarting nconfig.\n"
+"Terminal configuration\n"
+"----------------------\n"
+"If you use nconfig in a xterm window, make sure your TERM environment\n"
+"variable specifies a terminal configuration which supports at least\n"
+"16 colors.  Otherwise nconfig will look rather bad.\n"
 "\n"
-"Other information\n"
-"-----------------\n"
-"If you use nconfig in an XTERM window make sure you have your\n"
-"$TERM variable set to point to a xterm definition which supports color.\n"
-"Otherwise, nconfig will look rather bad.  nconfig will not\n"
-"display correctly in a RXVT window because rxvt displays only one\n"
-"intensity of color, bright.\n"
+"If the \"stty size\" command reports the current terminalsize correctly,\n"
+"nconfig will adapt to sizes larger than the traditional 80x25 \"standard\"\n"
+"and display longer menus properly.\n"
 "\n"
-"nconfig will display larger menus on screens or xterms which are\n"
-"set to display more than the standard 25 row by 80 column geometry.\n"
-"In order for this to work, the \"stty size\" command must be able to\n"
-"display the screen's current row and column geometry.  I STRONGLY\n"
-"RECOMMEND that you make sure you do NOT have the shell variables\n"
-"LINES and COLUMNS exported into your environment.  Some distributions\n"
-"export those variables via /etc/profile.  Some ncurses programs can\n"
-"become confused when those variables (LINES & COLUMNS) don't reflect\n"
-"the true screen size.\n"
 "\n"
-"Optional personality available\n"
-"------------------------------\n"
-"If you prefer to have all of the options listed in a single menu, rather\n"
-"than the default multimenu hierarchy, run the nconfig with NCONFIG_MODE\n"
-"environment variable set to single_menu. Example:\n"
+"Single menu mode\n"
+"----------------\n"
+"If you prefer to have all of the menu entries listed in a single menu,\n"
+"rather than the default multimenu hierarchy, run nconfig with\n"
+"NCONFIG_MODE environment variable set to single_menu.  Example:\n"
 "\n"
 "make NCONFIG_MODE=single_menu nconfig\n"
 "\n"
-"<Enter> will then unroll the appropriate category, or enfold it if it\n"
-"is already unrolled.\n"
+"<Enter> will then unfold the appropriate category, or fold it if it\n"
+"is already unfolded.  Folded menu entries will be designated by a\n"
+"leading \"++>\" and unfolded entries by a leading \"-->\".\n"
 "\n"
-"Note that this mode can eventually be a little more CPU expensive\n"
-"(especially with a larger number of unrolled categories) than the\n"
-"default mode.\n"
+"Note that this mode can eventually be a little more CPU expensive than\n"
+"the default mode, especially with a larger number of unfolded submenus.\n"
 "\n"),
 menu_no_f_instructions[] = N_(
-" You do not have function keys support. Please follow the\n"
-" following instructions:\n"
-" Arrow keys navigate the menu.\n"
-" <Enter> or <right-arrow> selects submenus --->.\n"
-" Capital Letters are hotkeys.\n"
-" Pressing <Y> includes, <N> excludes, <M> modularizes features.\n"
-" Pressing SpaceBar toggles between the above options.\n"
-" Press <Esc> or <left-arrow> to go back one menu,\n"
-" <?> or <h> for Help, </> for Search.\n"
-" <1> is interchangeable with <F1>, <2> with <F2>, etc.\n"
-" Legend: [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
-" <Esc> always leaves the current window.\n"),
+"Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
+"Submenus are designated by a trailing \"--->\".\n"
+"\n"
+"Use the following keys to navigate the menus:\n"
+"Move up or down with <Up> and <Down>.\n"
+"Enter a submenu with <Enter> or <Right>.\n"
+"Exit a submenu to its parent menu with <Esc> or <Left>.\n"
+"Pressing <y> includes, <n> excludes, <m> modularizes features.\n"
+"Pressing <Space> cycles through the available options.\n"
+"To search for menu entries press </>.\n"
+"<Esc> always leaves the current window.\n"
+"\n"
+"You do not have function keys support.\n"
+"Press <1> instead of <F1>, <2> instead of <F2>, etc.\n"
+"For verbose global help use key <1>.\n"
+"For help related to the current menu entry press <?> or <h>.\n"),
 menu_instructions[] = N_(
-" Arrow keys navigate the menu.\n"
-" <Enter> or <right-arrow> selects submenus --->.\n"
-" Capital Letters are hotkeys.\n"
-" Pressing <Y> includes, <N> excludes, <M> modularizes features.\n"
-" Pressing SpaceBar toggles between the above options\n"
-" Press <Esc>, <F5> or <left-arrow> to go back one menu,\n"
-" <?>, <F1> or <h> for Help, </> for Search.\n"
-" <1> is interchangeable with <F1>, <2> with <F2>, etc.\n"
-" Legend: [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
-" <Esc> always leaves the current window\n"),
+"Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
+"Submenus are designated by a trailing \"--->\".\n"
+"\n"
+"Use the following keys to navigate the menus:\n"
+"Move up or down with <Up> or <Down>.\n"
+"Enter a submenu with <Enter> or <Right>.\n"
+"Exit a submenu to its parent menu with <Esc> or <Left>.\n"
+"Pressing <y> includes, <n> excludes, <m> modularizes features.\n"
+"Pressing <Space> cycles through the available options.\n"
+"To search for menu entries press </>.\n"
+"<Esc> always leaves the current window.\n"
+"\n"
+"Pressing <1> may be used instead of <F1>, <2> instead of <F2>, etc.\n"
+"For verbose global help press <F1>.\n"
+"For help related to the current menu entry press <?> or <h>.\n"),
 radiolist_instructions[] = N_(
-" Use the arrow keys to navigate this window or\n"
-" press the hotkey of the item you wish to select\n"
-" followed by the <SPACE BAR>.\n"
-" Press <?>, <F1> or <h> for additional information about this option.\n"),
+"Press <Up>, <Down>, <Home> or <End> to navigate a radiolist, select\n"
+"with <Space>.\n"
+"For help related to the current entry press <?> or <h>.\n"
+"For global help press <F1>.\n"),
 inputbox_instructions_int[] = N_(
 "Please enter a decimal value.\n"
 "Fractions will not be accepted.\n"
-"Press <RETURN> to accept, <ESC> to cancel."),
+"Press <Enter> to apply, <Esc> to cancel."),
 inputbox_instructions_hex[] = N_(
 "Please enter a hexadecimal value.\n"
-"Press <RETURN> to accept, <ESC> to cancel."),
+"Press <Enter> to apply, <Esc> to cancel."),
 inputbox_instructions_string[] = N_(
 "Please enter a string value.\n"
-"Press <RETURN> to accept, <ESC> to cancel."),
+"Press <Enter> to apply, <Esc> to cancel."),
 setmod_text[] = N_(
-"This feature depends on another which\n"
-"has been configured as a module.\n"
-"As a result, this feature will be built as a module."),
+"This feature depends on another feature which has been configured as a\n"
+"module.  As a result, the current feature will be built as a module too."),
 load_config_text[] = N_(
 "Enter the name of the configuration file you wish to load.\n"
-"Accept the name shown to restore the configuration you\n"
-"last retrieved.  Leave blank to abort."),
+"Accept the name shown to restore the configuration you last\n"
+"retrieved.  Leave empty to abort."),
 load_config_help[] = N_(
-"\n"
 "For various reasons, one may wish to keep several different\n"
 "configurations available on a single machine.\n"
 "\n"
 "If you have saved a previous configuration in a file other than the\n"
-"default one, entering its name here will allow you to modify that\n"
-"configuration.\n"
+"default one, entering its name here will allow you to load and modify\n"
+"that configuration.\n"
 "\n"
-"If you are uncertain, then you have probably never used alternate\n"
-"configuration files.  You should therefor leave this blank to abort.\n"),
+"Leave empty to abort.\n"),
 save_config_text[] = N_(
 "Enter a filename to which this configuration should be saved\n"
-"as an alternate.  Leave blank to abort."),
+"as an alternate.  Leave empty to abort."),
 save_config_help[] = N_(
-"\n"
-"For various reasons, one may wish to keep different configurations\n"
-"available on a single machine.\n"
+"For various reasons, one may wish to keep several different\n"
+"configurations available on a single machine.\n"
 "\n"
 "Entering a file name here will allow you to later retrieve, modify\n"
 "and use the current configuration as an alternate to whatever\n"
 "configuration options you have selected at that time.\n"
 "\n"
-"If you are uncertain what all this means then you should probably\n"
-"leave this blank.\n"),
+"Leave empty to abort.\n"),
 search_help[] = N_(
-"\n"
-"Search for symbols and display their relations. Regular expressions\n"
-"are allowed.\n"
-"Example: search for \"^FOO\"\n"
+"Search for symbols (configuration variable names CONFIG_*) and display\n"
+"their relations.  Regular expressions are supported.\n"
+"Example:  Search for \"^FOO\".\n"
 "Result:\n"
 "-----------------------------------------------------------------\n"
 "Symbol: FOO [ = m]\n"
@@ -230,26 +222,26 @@ search_help[] = N_(
 "Selects: LIBCRC32\n"
 "Selected by: BAR\n"
 "-----------------------------------------------------------------\n"
-"o The line 'Prompt:' shows the text used in the menu structure for\n"
-"  this symbol\n"
-"o The 'Defined at' line tell at what file / line number the symbol\n"
-"  is defined\n"
-"o The 'Depends on:' line tell what symbols needs to be defined for\n"
-"  this symbol to be visible in the menu (selectable)\n"
-"o The 'Location:' lines tell where in the menu structure this symbol\n"
-"  is located\n"
-"    A location followed by a [ = y] indicate that this is a selectable\n"
-"    menu item - and current value is displayed inside brackets.\n"
-"o The 'Selects:' line tell what symbol will be automatically\n"
-"  selected if this symbol is selected (y or m)\n"
-"o The 'Selected by' line tell what symbol has selected this symbol\n"
+"o  The line 'Prompt:' shows the text displayed for this symbol in\n"
+"   the menu hierarchy.\n"
+"o  The 'Defined at' line tells at what file / line number the symbol is\n"
+"   defined.\n"
+"o  The 'Depends on:' line lists symbols that need to be defined for\n"
+"   this symbol to be visible and selectable in the menu.\n"
+"o  The 'Location:' lines tell, where in the menu structure this symbol\n"
+"   is located.  A location followed by a [ = y] indicates that this is\n"
+"   a selectable menu item, and the current value is displayed inside\n"
+"   brackets.\n"
+"o  The 'Selects:' line tells, what symbol will be automatically selected\n"
+"   if this symbol is selected (y or m).\n"
+"o  The 'Selected by' line tells what symbol has selected this symbol.\n"
 "\n"
 "Only relevant lines are shown.\n"
 "\n\n"
 "Search examples:\n"
-"Examples: USB  => find all symbols containing USB\n"
-"          ^USB => find all symbols starting with USB\n"
-"          USB$ => find all symbols ending with USB\n"
+"USB  => find all symbols containing USB\n"
+"^USB => find all symbols starting with USB\n"
+"USB$ => find all symbols ending with USB\n"
 "\n");
 
 struct mitem {
@@ -393,7 +385,7 @@ static void print_function_line(void)
 static void handle_f1(int *key, struct menu *current_item)
 {
 	show_scroll_win(main_window,
-			_("README"), _(nconf_readme));
+			_("Global help"), _(nconf_global_help));
 	return;
 }
 
@@ -408,7 +400,7 @@ static void handle_f2(int *key, struct menu *current_item)
 static void handle_f3(int *key, struct menu *current_item)
 {
 	show_scroll_win(main_window,
-			_("Instructions"),
+			_("Short help"),
 			_(current_instructions));
 	return;
 }
-- 
1.7.2.5

