Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:52202 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754240Ab3EKU6H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 May 2013 16:58:07 -0400
Received: by mail-we0-f176.google.com with SMTP id p60so4872545wes.7
        for <linux-kbuild@vger.kernel.org>; Sat, 11 May 2013 13:58:06 -0700 (PDT)
Date: Sat, 11 May 2013 22:58:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [RFC] mconf: make extensive use of ncurses' variables LINES and
 COLS.
Message-ID: <20130511205802.GD3222@free.fr>
References: <gid2szuh1p.fsf@karga.hank.lab>
 <20130511094818.GA3222@free.fr>
 <gh1u9d9315.fsf@mx10.gouders.net>
 <ghsj1t7o47.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghsj1t7o47.fsf@mx10.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-11 13:27 +0200, Dirk Gouders spake thusly:
> Dirk Gouders <dirk@gouders.net> writes:
[--SNIP--]
> From a8f5ff2e666d467c84ece16e1fe783ac89ceaa60 Mon Sep 17 00:00:00 2001
> From: Dirk Gouders <dirk@gouders.net>
> Date: Sat, 11 May 2013 12:46:12 +0200
> Subject: [PATCH v3] mconf: Use ncurses' variables LINES and COLS according to the
>  documentation.
> 
> According to the documentation [1], LINES and COLS are initialized by
> initscr().  So, use these variables in init_dialog().
> 
> The documentation does not say anything about the behavior when
> windows are resized.  Do not rely on the current implementation
> of ncurses that updates these variables on resize, but use the propper
> function calls to get window dimensions.

You missed three occurences of COLS in:
    scripts/kconfig/lxdialog/util.c:dialog_clear


> diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
> index a0e97c2..9b528a2 100644
> --- a/scripts/kconfig/lxdialog/util.c
> +++ b/scripts/kconfig/lxdialog/util.c
> @@ -309,15 +309,12 @@ void dialog_clear(void)
>   */
>  int init_dialog(const char *backtitle)
>  {
> -	int height, width;
> -
>  	initscr();		/* Init curses */
>  
>  	/* Get current cursor position for signal handler in mconf.c */
>  	getyx(stdscr, saved_y, saved_x);
>  
> -	getmaxyx(stdscr, height, width);
> -	if (height < 19 || width < 80) {
> +	if (LINES < 19 || COLS < 80) {

I know that COLS and LINES are correct right here since we just called
initscr, but for the sake of consistency, I think we'd better use the
functions here, too.

Also, it's a pain to apply your patches, since 'git am' will use the
entire body of the mail as the commit message.

I know you have issues using 'git send-email', but could you please at
least add a scissor-line as the last line of your email body, which will
make 'git am' ignore whatever is above that line (and that line itself):
    ---8<---        <- This is a scissor-line

And please do not attach the patch, add it in the body of the mail.
Use 'git format-patch' to prepare your patch(es), and just send the
resulting file(s) as the mail (hopefully, gnus is able to use an
existing file as the mail to send).

Otherwise, LGTM.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
