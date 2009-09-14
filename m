Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52744 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756247AbZINVtf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:35 -0400
Message-Id: <200909142149.n8ELnEJq018815@imap1.linux-foundation.org>
Subject: [patch 13/18] gconfig: disable "typeahead find" search in treeviews
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, flameeyes@gmail.com, zippel@linux-m68k.org

From: Diego Elio 'Flameeyes' Pettenò  <flameeyes@gmail.com>

When typeahead find is enabled, using 'y', 'n' and 'm' to change the status
of the configuration items will also start up the search system, making you
jump around the configuration.

Disabling the enable_search property does not mean that search is not
possible, it only disables the typeahead; to execute a search in the
treeview, you can just call it up explicitly (i.e.: on most systems that
will be Ctrl-f).

Signed-off-by: Diego Elio 'Flameeyes' Pettenò  <flameeyes@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/kconfig/gconf.glade |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/kconfig/gconf.glade~gconfig-disable-typeahead-find-search-in-treeviews scripts/kconfig/gconf.glade
--- a/scripts/kconfig/gconf.glade~gconfig-disable-typeahead-find-search-in-treeviews
+++ a/scripts/kconfig/gconf.glade
@@ -547,7 +547,7 @@
 		  <property name="headers_visible">True</property>
 		  <property name="rules_hint">False</property>
 		  <property name="reorderable">False</property>
-		  <property name="enable_search">True</property>
+		  <property name="enable_search">False</property>
 		  <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:58:22 GMT"/>
 		  <signal name="button_press_event" handler="on_treeview1_button_press_event" last_modification_time="Sun, 12 Jan 2003 16:03:52 GMT"/>
 		  <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 16:11:44 GMT"/>
@@ -582,7 +582,7 @@
 		      <property name="headers_visible">True</property>
 		      <property name="rules_hint">False</property>
 		      <property name="reorderable">False</property>
-		      <property name="enable_search">True</property>
+		      <property name="enable_search">False</property>
 		      <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:57:55 GMT"/>
 		      <signal name="button_press_event" handler="on_treeview2_button_press_event" last_modification_time="Sun, 12 Jan 2003 15:57:58 GMT"/>
 		      <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 15:58:01 GMT"/>
_
