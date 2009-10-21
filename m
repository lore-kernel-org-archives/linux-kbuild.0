Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:33998 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbZJUGru convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 Oct 2009 02:47:50 -0400
MIME-Version: 1.0
In-Reply-To: <20091019201252.GA14977@merkur.ravnborg.org>
References: <1255357820-7122-1-git-send-email-nir.tzachar@gmail.com>
	 <20091019201252.GA14977@merkur.ravnborg.org>
Date: Wed, 21 Oct 2009 08:47:54 +0200
Message-ID: <9b2db90b0910202347v27a75de0o32ba2b9932f9d16a@mail.gmail.com>
Subject: Re: [PATCH] nconfig v4
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, zippel@linux-m68k.org

Hi Sam.

>
> Hi Nir.
>
> I have used nconfig for a while now and I prefer it over menuconfig.
> nconfig tries to be a clone of menuconfig in meny respects failing
> to address some of the shortcomings.
>
> Some of the caveats I have with nconfig (and with menuconfig):
>
> - We have the buttons in the bottom of the sceen.
>  What I would like to see is that the "<Select>" button are removed.
>  And then you use some other way to indicate if a menu line is
>  selected or one of the other buttons are selected.
>  You will need to rethink arrow navigation a little..

This is easier said than done.... You need some kind of tabbing
behaviour between the main menu and the button menu. I think it would
just become more cumbersome this way. I'm open for better suggestions
though.

> - When I enter 2nd level I would like two possibilities:
>  <Back> and <Exit>
>  <Exit> would bring me to the save dialog (if anything had changed)
>  <Back> would bring me up one level

I agree. This is a good idea.

> - Do not try to be so 'intelligent' with hotkeys. They are _always_ the first letter
>  in the menu line and be done with that.
>  Lines that start with "M" then does not have any hotkey - they must live with that

However, there are more letters than 'M': N (for No), Y (for Yes), Q
(for quit), H (for Help),
i,j,k,l (for navigation). This leaves many menu items without a
hotkey, which I think would not be convenient.

> - The help dialog need an "OK" button or a "Close" button so I know that
>  I can select it to get out again.

This can easily be achieved by placing a highlighted text with 'Close'
on the bottom, and exiting the dialog when the user presses 'Enter'

> - The save dialog is broken. I cannot use the ESC ESC option and that was
>  a hack anyway.
>  If I press "ESC" then I should be back at nconfig.
>  I would expect the save dialog to have three choises:
>  "Close without saving"
>  "Cancel"
>  "Save"

Ok, will be fixed.

> Have you looked at xconfig and considered if any of the features of
> xconfig would be useful in nconfig?
> See debug stuff, etc...?

I'll see if I can incorporate the debug option. Maybe by adding a
configuration dialog??

> My thinking is that we should try to make nconfig the default for menuconfig
> at least in -next. Then we will see some comments...
> But try if you can improve the above points first.

Sure. I hope to have a new version in a few days.
Thanks.
