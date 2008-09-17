Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.28]:12378 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752423AbYIQL6R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 07:58:17 -0400
Received: by yw-out-2324.google.com with SMTP id 9so927457ywe.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Sep 2008 04:58:16 -0700 (PDT)
Message-ID: <9b2db90b0809170458t20cf814dkbc58f434924a22d7@mail.gmail.com>
Date: Wed, 17 Sep 2008 14:58:15 +0300
From: "Nir Tzachar" <nir@tzachar.com>
Subject: Re: [PATCH] ncurses based config V2
In-Reply-To: <20080914105250.GB3811@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
	 <1220603220-17090-1-git-send-email-nir@tzachar.com>
	 <20080905195930.GA27913@1wt.eu>
	 <9b2db90b0809052241m39667ae6x14270ff942beeff@mail.gmail.com>
	 <20080914105250.GB3811@1wt.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, bzolnier@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, ariveira@gmail.com, rdunlap@xenotime.net, kosaki.motohiro@jp.fujitsu.com, 7eggert@gmx.de

Hi.

On Sun, Sep 14, 2008 at 1:52 PM, Willy Tarreau <w@1wt.eu> wrote:
> Hello,
>
> sorry, it seems I missed this mail.
>
> On Sat, Sep 06, 2008 at 08:41:56AM +0300, Nir Tzachar wrote:
>> Hello.
>>
>> On Fri, Sep 5, 2008 at 10:59 PM, Willy Tarreau <w@1wt.eu> wrote:
>> > Hello,
>> >
>> > On Fri, Sep 05, 2008 at 11:27:00AM +0300, Nir Tzachar wrote:
>> >> Changes:
>> >> 1) Fixed segfaults in help window.
>> >> 2) Removed the instructions window, made the instructions appear as a button
>> >>    which displays a popup window.
>> >> 3) Added hot keys support. As ncurses does not support several colors inside
>> >>    a menu, keys are highlighted using "()".
>> >> 4) Optimized for 80x24 terminals.
>> >> 6) Fixed zconf.y to use _menu_init
>> >> 7) added nconfig to "make help"
>> >> 8) Misc fixes.
>> >>
>> >> Comments are appreciated.
>> >
>> > OK, I've just tried it. Here are the first comments I can make :
>> >
>> >  - colors are too dark. Cyan on black is barely readable, red on black is
>> >    almost unreadable and blue on black is not readable at all, I have to
>> >    switch off the light to read it. Most often you'll see light shades of
>> >    grey (even white) in interfaces because it's hard to see dark shades,
>> >    and bright flashy letters would dazzle and be seen as fuzzy. Many colors
>> >    are perfectly readable on while or even light grey (except yellow and
>> >    sometimes cyan). Blue backgrounds were often used under DOS and were
>> >    OK with almost all colors except red (well-known eye focus problem).
>> >    But there was a trick, pixels were very large in 640x200, nowaydays
>> >    we have small pixels and letters are not much readable anymore on blue
>> >    backgrounds. For your tests, you can try to load
>> >    xterm -bg <color> -fg <color> and ensure that you're using a medium
>> >    font (tickness of 1-pixel).
>>
>> The thing with colors is that they are very personal...
>
> "personal" is true when it comes from a matter of taste. Here it's a matter
> of readability.
>> The colors I
>> have work great on my terminals. I don't think I can come up with one
>> scheme which looks nice to everybody, hence the support for color
>> schemes.
>
> I understand. I think that the original colors of make menuconfig are
> OK and readable everywhere.

But they give it a very archaic look. We should come up with something better.

>> If you can come up with a color scheme which works gr8 for
>> you, I'll be happy to add it. If you are interested, check the
>> INIT_PAIR macros of the patch.
>
> OK I might do (I just don't have time right now).

That would be gr8.

>> >  - pressing arrows too fast regularly escapes (probably because of the
>> >    ESC prefix, I don't know). This is rather strange, because no other
>> >    application does this to me.
>>
>> I cannot reproduce this. What terminal emulator are you using, and
>> which ncurses version?
>
> I've just checked, ncurses-5.3. I also ensured that it's the same I
> use with all my other progs (including mutt, vim, emacs, alsamixer,
> less, gnuplot, kismet, lynx, ...). It is possible that there is something
> very subtle, but I can't imagine what :-/

I can't reproduce this. I tried with ncurses 5.3 and a clean xterm,
and it works ok. Try to
$> export TERM=vt100 before and tell me if this helps. In any way, can
you please send me your termcap file? I'm grabbing at straws here...

>> Also, can you please send me the terminal emulator config file?
>
> It's just a bare xterm running with TERM=xterm-color. I forgot to test on
> the console.
>
>> >    Is there a specific initialization
>> >    sequence with ncurses to state that arrows should return special codes
>> >    instead of the ESC prefix ? (I have no idea)
>>
>> Yes. You need to specify you want to get keypad events, otherwise they
>> just appear as ESC.
>
> OK. I just found there is the ESCDELAY variable to define the ESC timeout.
> They also talk about notimeout() in curs_inopts(3), which sounds pretty
> well related to what I observe.

They do not have the same effect. Using ESCDELAY is a hack, but there
is no better option to get a plain ESC key without a timeout.

> [skipping all fixed reports]
>
>> >  - I'm not convinced that the parenthesis around hotkeys make the menu
>> >    that much readable, especially when there are lots of short words or
>> >    even acronyms. Eg :
>> >        [ ]   (U)TS namespace
>> >        [ ]   (I)PC namespace
>> >        [ ]   (U)ser namespace (EXPERIMENTAL)
>> >        [ ]   (P)ID Namespaces (EXPERIMENTAL)
>>
>> I agree, but could not come up with any other visible mark to note the hotkey.
>>
>> >    I don't know if there is something such as a bold attribute in ncurses,
>> >    it would make sense to use it IMHO because you don't force a color on
>> >    people's terms, you rely on the style which works well for them.
>>
>> There is a bold attribute, but you cannot set it for a single letter
>> of a menu item, as far as I know.
>
> OK I understand. You might want to use the brighter color set (as menuconfig
> does). Terminals sometimes translate them to bold characters.

All the text in a menu item must be in the same color and with the
same attributes. There is no way to emphasize a single section, either
by coloring it differently or making it bold.

>> > I'm sorry I don't go further for now, the arrows causing frequent exits is
>> > too bothersome, I've started it about 30 times just for this report, it's
>> > too hard to navigate. I hope that the points above are already helpful.
>>
>> Thanks for the input. I would really like to solve the issue you have
>> with arrow keys. Can you also send a trace of key presses which cause
>> you to exit, and which window is active?
>
> Sorry, the directory in which I built has been removed since. But it happened
> in any window, starting with the main menu. That's why I think it's just an
> initialization issue.

What do you mean by an "initialization issue" ?

Thanks.
