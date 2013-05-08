Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:35823 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753399Ab3EHP3r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 11:29:47 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v3] let lxdialog/util.c:print_autowrap() handle newline characters
In-Reply-To: <20130508150446.GE3413@free.fr> (Yann E. MORIN's message of "Wed,
	8 May 2013 17:04:46 +0200")
References: <gisj1xn0un.fsf@karga.hank.lab> <giobclmyw3.fsf@karga.hank.lab>
	<20130508133522.GD3413@free.fr> <gifvxxmucf.fsf@karga.hank.lab>
	<20130508150446.GE3413@free.fr>
Date: Wed, 08 May 2013 17:29:42 +0200
Message-ID: <ghli7pa3rt.fsf_-_@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

--=-=-=

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

>> > Next time you have to send a patch, could you please:
>> >   - use 'git send-email': that will properly format the patch for
>> >     sending via email, especially, it does not attach the patch, but
>> >     in-lines it in the body of the mail, which makes it easier to review
>> >   - when you send a second (or third...) version of a patch, append a 'v2'
>> >     (or v3, and so on...) to the subject, like: [PATCH v2] Bla blabla...
>> 
>> Sorry for the inconveniences, I will do my best with the revised version
>> of the patch.
>
> No problem, I was just giving some hints! :-)

Please do not get it as if I am ignoring your hints, Yann, but I still
need some time for "git send-email", because of certificate-based
authorization.  So, for this mail I still use gnus...

But I hope I got the Subject right and will do my best to get the patch
attached inline. 

>> >>         Do you wish to save your new configuration ? <ESC><ESC>
>> >>         to continue.
>> >
>> > Did you try to replace all the spaces there with newlines, and see what
>> > happens? Hint: it's ugly, but not because of the newlines: the window is
>> > not resized accordingly to the new number of lines, so better fix that
>> > before, too.
>> 
>> Yes, I noticed that when I put just two newlines into that text.  In general
>> it happens for any text (also without newlines) that does not fit the
>> window height.
>> 
>> I solved the problem by adjusting the third parameter in the call to
>> dialog_yesno() and thought that that is the correct way to handle the
>> window-height-problem if the text does not fit, because print_autowrap()
>> currently does not care at all if the given text breaks the window.
>
> You are right: it is a non-issue so far; all rendered text currently fit
> in their respective windows. If those texts get updated, it will be the
> responsibility to the author to adjust the windows height.
>
> Note: the english texts do fit, but I did not check that all
> translations do. But are there anyone really using the localised texts
> at all?
>
> I'll get your patch as-is in my tree. Depending on Michal, maybe we can
> queue it in for 3.10. Not too sure, though: the merge window is on the
> verge of closing, and I'd prefer changes linger for a while in Michal'
> then next's trees before getting mainlined.

I found another issue in my patch and that is a missing initialization of
the variable "newline_separator", so you probably prefer this third
version.  I did not notice problems with this issue, but I could well
imagine, others will.

>> But I agree, I would be nice if print_autowrap() could handle such cases
>> and I will see if I find a way to do that.  I am unsure if that should
>> go into one single patch/commit, though.
>
> Not needed for now, but if you want to work on this, then please do one
> patch for each semantically self-contained change. Adjusting the height
> of the window is not tied to rendering the '\n'.

I agree and I expect it to be a more serious change to mconf.

Dirk


--=-=-=
Content-Disposition: inline; filename=patch.txt
Content-Description: patch

From dcaab3b8c6c9df84cba26fcc47c244932642f292 Mon Sep 17 00:00:00 2001
From: Dirk Gouders <gouders@et.bocholt.fh-gelsenkirchen.de>
Date: Wed, 8 May 2013 17:06:37 +0200
Subject: [PATCH v3] When exiting menuconfig with unsaved changes, a dialog like
 the following is shown

        Do you wish to save your new configuration ? <ESC><ESC>
        to continue.

The author of the dialog text specified a newline and probably
expected it to be processed, so let print_autowrap() handle newlines propperly.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/lxdialog/util.c | 31 +++++++++++++++++--------------
 scripts/kconfig/mconf.c         |  4 ++--
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index a0e97c2..cfee00c 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -371,27 +371,19 @@ void print_title(WINDOW *dialog, const char *title, int width)
 /*
  * Print a string of text in a window, automatically wrap around to the
  * next line if the string is too long to fit on one line. Newline
- * characters '\n' are replaced by spaces.  We start on a new line
+ * characters '\n' are propperly processed.  We start on a new line
  * if there is no room for at least 4 nonblanks following a double-space.
  */
 void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 {
 	int newl, cur_x, cur_y;
-	int i, prompt_len, room, wlen;
-	char tempstr[MAX_LEN + 1], *word, *sp, *sp2;
+	int prompt_len, room, wlen;
+	char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline_separator = 0;
 
 	strcpy(tempstr, prompt);
 
 	prompt_len = strlen(tempstr);
 
-	/*
-	 * Remove newlines
-	 */
-	for (i = 0; i < prompt_len; i++) {
-		if (tempstr[i] == '\n')
-			tempstr[i] = ' ';
-	}
-
 	if (prompt_len <= width - x * 2) {	/* If prompt is short */
 		wmove(win, y, (width - prompt_len) / 2);
 		waddstr(win, tempstr);
@@ -401,7 +393,10 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 		newl = 1;
 		word = tempstr;
 		while (word && *word) {
-			sp = strchr(word, ' ');
+			sp = strpbrk(word, "\n ");
+			if (sp && *sp == '\n')
+				newline_separator = sp;
+
 			if (sp)
 				*sp++ = 0;
 
@@ -413,7 +408,7 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			if (wlen > room ||
 			    (newl && wlen < 4 && sp
 			     && wlen + 1 + strlen(sp) > room
-			     && (!(sp2 = strchr(sp, ' '))
+			     && (!(sp2 = strpbrk(sp, "\n "))
 				 || wlen + 1 + (sp2 - sp) > room))) {
 				cur_y++;
 				cur_x = x;
@@ -421,7 +416,15 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			wmove(win, cur_y, cur_x);
 			waddstr(win, word);
 			getyx(win, cur_y, cur_x);
-			cur_x++;
+
+			/* Move to the next line if the word separator was a newline */
+			if (newline_separator) {
+				cur_y++;
+				cur_x = x;
+				newline_separator = 0;
+			} else
+				cur_x++;
+
 			if (sp && *sp == ' ') {
 				cur_x++;	/* double space */
 				while (*++sp == ' ') ;
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 387dc8d..a258b8c 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -956,8 +956,8 @@ static int handle_exit(void)
 	dialog_clear();
 	if (conf_get_changed())
 		res = dialog_yesno(NULL,
-				   _("Do you wish to save your new configuration ?\n"
-				     "<ESC><ESC> to continue."),
+				   _("Do you wish to save your new configuration?\n"
+				     "(Press <ESC><ESC> to continue kernel configuration.)"),
 				   6, 60);
 	else
 		res = -1;
-- 
1.8.2.1


--=-=-=--
