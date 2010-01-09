Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:48099 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754620Ab0AIQrZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Jan 2010 11:47:25 -0500
MIME-Version: 1.0
In-Reply-To: <1262875968-1078-1-git-send-email-mmarek@suse.cz>
References: <1262875968-1078-1-git-send-email-mmarek@suse.cz>
Date: Sat, 9 Jan 2010 18:47:21 +0200
Message-ID: <9b2db90b1001090847n5d294f26re43686722435742f@mail.gmail.com>
Subject: Re: [PATCH 0/2] nconfig
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 7, 2010 at 4:52 PM, Michal Marek <mmarek@suse.cz> wrote:
> Hi Nir,
>
> Just FYI: I queued nconfig for the next merge window. I added a patch to
> mark some functions static and changed the description of your patch,
> otherwise it's the v7 version you posted.

Thats gr8. Thanks.

I would also appreciate if you can add the patch I sent Jan (attached
below). It fixed the problem Jan raised. If you need, I'll make it a
proper patch on top of v7.

Cheers.

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 8c56150..cab6bb0 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -984,7 +984,7 @@ static void build_conf(struct menu *menu)
                               break;
                       default:
                               tmp = 2 + strlen(sym_get_string_value(sym));
-                               item_make(menu, 's', "(%s)",
+                               item_make(menu, 's', "    (%s)",
                                               sym_get_string_value(sym));
                               tmp = indent - tmp + 4;
                               if (tmp < 0)
@@ -1072,8 +1072,8 @@ static void show_menu(const char *prompt, const
char *instructions,

       /* position the menu at the middle of the screen */
       scale_menu(curses_menu, &maxy, &maxx);
-       maxx = min(maxx, mwin_max_cols);
-       maxy = mwin_max_lines-1;
+       maxx = min(maxx, mwin_max_cols-2);
+       maxy = mwin_max_lines-2;
       menu_window = derwin(main_window,
                       maxy,
                       maxx,
