Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41476 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754366Ab0HHQLy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Aug 2010 12:11:54 -0400
Received: by fxm14 with SMTP id 14so4606207fxm.19
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Aug 2010 09:11:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100808154233.GB4205@merkur.ravnborg.org>
References: <20100808154233.GB4205@merkur.ravnborg.org>
Date: Sun, 8 Aug 2010 19:11:52 +0300
Message-ID: <AANLkTikDRoBx7mjXmigcac0wBdExDiBRhYPVS-mKe2YG@mail.gmail.com>
Subject: Re: nconfig - F2, F3 misbehaves..
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Sun, Aug 8, 2010 at 6:42 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Nir.
>
> When I press F2 at one of the top-level menus
> then nconfig exits and a '~' is written to stdout.
>
> Same happens when I press F3.
>
> If I press F2 or F3 at a submenu then I see only the README,
> and when I get back I am one level up in the menus.

This implies that the function keys are not processed correctly by
ncurses; e.g., they are seen as two characters, one of them is ESC. I
believe this is the reason why you are getting one menu back.

> I have not tried to debug this.
> It happens with and without the search patch.

Can you please try with a different terminal emulator? Also check that
you have a terminfo file which matches your terminal and TERM
environment variable.

>
>        Sam
>
