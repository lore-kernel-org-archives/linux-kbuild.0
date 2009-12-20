Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:45799 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbZLTIaN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Dec 2009 03:30:13 -0500
Received: from kpbe17.cbf.corp.google.com (kpbe17.cbf.corp.google.com [172.25.105.81])
	by smtp-out.google.com with ESMTP id nBK8UAfG023978
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Dec 2009 00:30:10 -0800
Received: from qyk13 (qyk13.prod.google.com [10.241.83.141])
	by kpbe17.cbf.corp.google.com with ESMTP id nBK8U9Ai022636
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Dec 2009 00:30:09 -0800
Received: by qyk13 with SMTP id 13so2058072qyk.31
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Dec 2009 00:30:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B28CC39.9010307@suse.cz>
References: <3b09bd800912142246u2d069702n759e165553bddc9f@mail.gmail.com>
	<4B279021.6070508@suse.cz> <3b09bd800912152056g40fab3f9q76aef60ccf525bd0@mail.gmail.com>
	<4B28CC39.9010307@suse.cz>
From: =?UTF-8?B?VmFkaW0gQmVuZGVidXJ5ICjQstCxKQ==?= <vbendeb@google.com>
Date: Sun, 20 Dec 2009 00:29:49 -0800
Message-ID: <3b09bd800912200029u24764aeje3063fb32de0fa90@mail.gmail.com>
Subject: Re: [PATCH] wrap long help lines, take two
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

2009/12/16 Michal Marek <mmarek@suse.cz>
>
> On 16.12.2009 05:56, Vadim Bendebury (вб) wrote:
> > 2009/12/15 Michal Marek <mmarek@suse.cz>:
> >> struct somename {
> >>  struct gstr *gstr;
> >>  int width;
> >>  /* other bookkeeping stuff like last_line_length */
> >> }
> >>
> >> Then expr_gstr_print would just initialize an instance of this structure
> >> and pass it to expr_print as the callback argument.
> >
> > I first thought about it, but decided against it, because the way it
> > is now it is a much more contained change. Yes, recalculating string
> > length every time is excessive, but in this particular case it is
> > harmless.I am also worried of the string modified elsewhere bypassing
> > the print helper function, which would take things out of sync and
> > cause corrupted data.
>
> expr_print() only sees a void pointer, so it can't modify any data
> hidden behind it. But I don't care, do it as you like, just please move
> the ncurses calls to menuconfig.
>
> Michal

Michal I looked at it a bit more, it seems that passing the width as
an argument to expr_gstr_print() is not such a good idea, especially
since it needs to originate in mconf.c:show_help() and make it all the
way to expr.c:expr_print_gstr_helper() - it's quite a few nested calls
where the argument needs to propagate through.

I ended up modifying the gstr structure adding a field to specify the
max width. It is excessive for other than mconf modes, but it seems a
small price to pay  to get a smallest contained change.

Please let me know what you think and if I need to resend the patch in
a separate email:

---

Help text for certain config options is very extensive (the text
includes the names of
all  other options the option in question depends on). Long lines are
not wrapped,
making it impossible to see the list.

This patch adds some logic which wraps help screen lines at word
boundaries to prevent truncating .

Tested by running

ARCH=powerpc make menuconfig O=/tmp/build

which shows that the long lines are now wrapped, and

 ARCH=powerpc make xconfig O=/tmp/build

to demonstrate that it still compiles and operates as expected.

Signed-off-by: Vadim Bendebury <vbendeb@google.com>
---
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index edd3f39..d83f232 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1097,9 +1097,32 @@ void expr_fprint(struct expr *e, FILE *out)

 static void expr_print_gstr_helper(void *data, struct symbol *sym,
const char *str)
 {
-       str_append((struct gstr*)data, str);
+       struct gstr *gs = (struct gstr*)data;
+       const char *sym_str = NULL;
+
+       if (sym)
+               sym_str = sym_get_string_value(sym);
+
+       if (gs->max_width) {
+               unsigned extra_length = strlen(str);
+               const char *last_cr = strrchr(gs->s, '\n');
+               unsigned last_line_length;
+
+               if (sym_str)
+                       extra_length += 4 + strlen(sym_str);
+
+               if (!last_cr)
+                       last_cr = gs->s;
+
+               last_line_length = strlen(gs->s) - (last_cr - gs->s);
+
+               if ((last_line_length + extra_length) > gs->max_width)
+                       str_append(gs, "\\\n");
+       }
+
+       str_append(gs, str);
        if (sym)
-               str_printf((struct gstr*)data, " [=%s]",
sym_get_string_value(sym));
+               str_printf(gs, " [=%s]", sym_str);
 }

 void expr_gstr_print(struct expr *e, struct gstr *gs)
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index f379b0b..95ce009 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -106,6 +106,11 @@ int file_write_dep(const char *name);
 struct gstr {
        size_t len;
        char  *s;
+       /*
+        * when max_width is not zero long lines in string s (if any) get
+        * wrapped not to exceed the max_width value
+        */
+       int max_width;
 };
 struct gstr str_new(void);
 struct gstr str_assign(const char *s);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 8413cf3..ac1e9da 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -638,6 +638,7 @@ static void show_help(struct menu *menu)
 {
        struct gstr help = str_new();

+       help.max_width = getmaxx(stdscr) - 10;
        menu_get_ext_help(menu, &help);

        show_helptext(_(menu_get_prompt(menu)), str_get(&help));
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index b6b2a46..81c100d 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -78,6 +78,7 @@ struct gstr str_new(void)
        struct gstr gs;
        gs.s = malloc(sizeof(char) * 64);
        gs.len = 64;
+       gs.max_width = 0;
        strcpy(gs.s, "\0");
        return gs;
 }
@@ -88,6 +89,7 @@ struct gstr str_assign(const char *s)
        struct gstr gs;
        gs.s = strdup(s);
        gs.len = strlen(s) + 1;
+       gs.max_width = 0;
        return gs;
 }

---
