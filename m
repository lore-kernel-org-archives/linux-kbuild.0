Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:51131 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755544Ab3EHNf1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 09:35:27 -0400
Received: by mail-wg0-f51.google.com with SMTP id b13so1843064wgh.18
        for <linux-kbuild@vger.kernel.org>; Wed, 08 May 2013 06:35:26 -0700 (PDT)
Date: Wed, 8 May 2013 15:35:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: RFC: let lxdialog/util.c:print_autowrap() handle newline
 characters
Message-ID: <20130508133522.GD3413@free.fr>
References: <gisj1xn0un.fsf@karga.hank.lab>
 <giobclmyw3.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <giobclmyw3.fsf@karga.hank.lab>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Dirk, All,

On Wed, May 08, 2013 at 02:36:44PM +0200, Dirk Gouders wrote:
> > Attached is a first version of a patch.  There are other (indirect)
> > users of print_autowrap() but for now I just modified the text for the
> > exit dialog.
> 
> Sorry for the noise, but I noticed that my patch did not propperly
> handle cases with short first words of new sentences.  While at it I
> noticed that strpbrk() makes the code more readable.

Next time you have to send a patch, could you please:
  - use 'git send-email': that will properly format the patch for
    sending via email, especially, it does not attach the patch, but
    in-lines it in the body of the mail, which makes it easier to review
  - when you send a second (or third...) version of a patch, append a 'v2'
    (or v3, and so on...) to the subject, like: [PATCH v2] Bla blabla...

> From 490668696c253bef74e8acd2ff943f20cc4da26b Mon Sep 17 00:00:00 2001
> From: Dirk Gouders <dirk@gouders.net>
> Date: Wed, 8 May 2013 14:28:30 +0200
> Subject: [PATCH] mconf: let print_autowrap() handle newline characters.
> 
> When exiting menuconfig with unsaved changes, a dialog like the following is
> shown
> 
>         Do you wish to save your new configuration ? <ESC><ESC>
>         to continue.

Did you try to replace all the spaces there with newlines, and see what
happens? Hint: it's ugly, but not because of the newlines: the window is
not resized accordingly to the new number of lines, so better fix that
before, too.

> The author of the dialog text specified a newline and probably
> expected it to be processed, so let print_autowrap() handle newlines propperly.

Also, please add your SoB (Signed-off-by) line:
    http://elinux.org/Developer_Certificate_Of_Origin

Otherwise, looks good. I'll do a more thorough review (and testing)
later (hopefully when you have fixed that window height issue).

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
