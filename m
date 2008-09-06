Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wr-out-0506.google.com ([64.233.184.229]:10557 "EHLO
	wr-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753236AbYIFFmA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 6 Sep 2008 01:42:00 -0400
Received: by wr-out-0506.google.com with SMTP id 69so759057wri.5
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Sep 2008 22:41:57 -0700 (PDT)
Message-ID: <9b2db90b0809052241m39667ae6x14270ff942beeff@mail.gmail.com>
Date: Sat, 6 Sep 2008 08:41:56 +0300
From: "Nir Tzachar" <nir@tzachar.com>
Subject: Re: [PATCH] ncurses based config V2
In-Reply-To: <20080905195930.GA27913@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
	 <1220603220-17090-1-git-send-email-nir@tzachar.com>
	 <20080905195930.GA27913@1wt.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, bzolnier@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, ariveira@gmail.com, rdunlap@xenotime.net, kosaki.motohiro@jp.fujitsu.com, 7eggert@gmx.de

Hello.

On Fri, Sep 5, 2008 at 10:59 PM, Willy Tarreau <w@1wt.eu> wrote:
> Hello,
>
> On Fri, Sep 05, 2008 at 11:27:00AM +0300, Nir Tzachar wrote:
>> Changes:
>> 1) Fixed segfaults in help window.
>> 2) Removed the instructions window, made the instructions appear as a button
>>    which displays a popup window.
>> 3) Added hot keys support. As ncurses does not support several colors inside
>>    a menu, keys are highlighted using "()".
>> 4) Optimized for 80x24 terminals.
>> 6) Fixed zconf.y to use _menu_init
>> 7) added nconfig to "make help"
>> 8) Misc fixes.
>>
>> Comments are appreciated.
>
> OK, I've just tried it. Here are the first comments I can make :
>
>  - colors are too dark. Cyan on black is barely readable, red on black is
>    almost unreadable and blue on black is not readable at all, I have to
>    switch off the light to read it. Most often you'll see light shades of
>    grey (even white) in interfaces because it's hard to see dark shades,
>    and bright flashy letters would dazzle and be seen as fuzzy. Many colors
>    are perfectly readable on while or even light grey (except yellow and
>    sometimes cyan). Blue backgrounds were often used under DOS and were
>    OK with almost all colors except red (well-known eye focus problem).
>    But there was a trick, pixels were very large in 640x200, nowaydays
>    we have small pixels and letters are not much readable anymore on blue
>    backgrounds. For your tests, you can try to load
>    xterm -bg <color> -fg <color> and ensure that you're using a medium
>    font (tickness of 1-pixel).

The thing with colors is that they are very personal... The colors I
have work great on my terminals. I don't think I can come up with one
scheme which looks nice to everybody, hence the support for color
schemes. If you can come up with a color scheme which works gr8 for
you, I'll be happy to add it. If you are interested, check the
INIT_PAIR macros of the patch.

>  - pressing arrows too fast regularly escapes (probably because of the
>    ESC prefix, I don't know). This is rather strange, because no other
>    application does this to me.

I cannot reproduce this. What terminal emulator are you using, and
which ncurses version? Also, can you please send me the terminal
emulator config file?

>    Is there a specific initialization
>    sequence with ncurses to state that arrows should return special codes
>    instead of the ESC prefix ? (I have no idea)

Yes. You need to specify you want to get keypad events, otherwise they
just appear as ESC.

>  - entering text in boxes (eg: local version) does not move the cursor,
>    it remains at the beginning of the line. If I press any arrow, the
>    box immediately closes (most likely the Esc prefix again).

Fixed.

>  - in the input boxes, spaces are missing aroung the title, which touches
>    the frame (eg: Local version again).

Fixed.

>  - in "instructions", it's not explained how to leave that box. I found
>    both Enter and Esc to work, but a last line with a small message would
>    be better.

Done.

>  - I noticed I was tempted a lot to press "?" to get help, but the key is
>    not bound. It would be nice to have it bound to Help since make oldconfig
>    and menuconfig to both report help that way.

It was supposed to work, I mistyped '?' with ':' . Fixed.

>  - I'm not convinced that the parenthesis around hotkeys make the menu
>    that much readable, especially when there are lots of short words or
>    even acronyms. Eg :
>        [ ]   (U)TS namespace
>        [ ]   (I)PC namespace
>        [ ]   (U)ser namespace (EXPERIMENTAL)
>        [ ]   (P)ID Namespaces (EXPERIMENTAL)

I agree, but could not come up with any other visible mark to note the hotkey.

>    I don't know if there is something such as a bold attribute in ncurses,
>    it would make sense to use it IMHO because you don't force a color on
>    people's terms, you rely on the style which works well for them.

There is a bold attribute, but you cannot set it for a single letter
of a menu item, as far as I know.

> I'm sorry I don't go further for now, the arrows causing frequent exits is
> too bothersome, I've started it about 30 times just for this report, it's
> too hard to navigate. I hope that the points above are already helpful.

Thanks for the input. I would really like to solve the issue you have
with arrow keys. Can you also send a trace of key presses which cause
you to exit, and which window is active?

Cheers.
