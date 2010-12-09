Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
Date: Thu, 09 Dec 2010 08:11:38 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] fix undesirable side effect of adding "visible" menu
	 attribute
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, mchehab@redhat.com, Michal Marek <mmarek@suse.cz>

This lead to non-selected, non-user-selectable options to be written
out to .config. This is not only pointless, but also preventing the
user to be prompted should any of those options eventually become
visible (e.g. by de-selecting the *_AUTO options the "visible"
attribute was added for.

Furthermore it is quite logical for the "visible" attribute of a menu
to control the visibility of all contained prompts, which is what the
patch does.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 scripts/kconfig/menu.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 2.6.37-rc5/scripts/kconfig/menu.c
+++ 2.6.37-rc5-kconfig-propagate-visibility/scripts/kconfig/menu.c
@@ -140,6 +140,20 @@ struct property *menu_add_prop(enum prop
 		}
 		if (current_entry->prompt && current_entry != &rootmenu)
 			prop_warn(prop, "prompt redefined");
+
+		/* Apply all upper menus' visibilities to actual prompts. */
+		if(type == P_PROMPT) {
+			struct menu *menu = current_entry;
+
+			while ((menu = menu->parent) != NULL) {
+				if (!menu->visibility)
+					continue;
+				prop->visible.expr
+					= expr_alloc_and(prop->visible.expr,
+							 menu->visibility);
+			}
+		}
+
 		current_entry->prompt = prop;
 	}
 	prop->text = prompt;



