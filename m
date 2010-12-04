Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:34538 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755600Ab0LDTx1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 14:53:27 -0500
Received: by iwn6 with SMTP id 6so1427552iwn.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 11:53:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291487421.8025.69.camel@localhost>
References: <1290488397.6770.1404.camel@localhost>
	<20101203122347.GA12395@sepie.suse.cz>
	<1291482609.8025.57.camel@localhost>
	<AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
	<1291487421.8025.69.camel@localhost>
Date: Sat, 4 Dec 2010 14:53:26 -0500
Message-ID: <AANLkTik8OgrFRYKF6PS5MkawDDojmF_yEnFtTcnjz4Pp@mail.gmail.com>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

On Sat, Dec 4, 2010 at 1:30 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Sat, 2010-12-04 at 13:11 -0500, Arnaud Lacombe wrote:
> [...]
>> > +static void report_conf(struct menu *menu, bool verbose)
>> > +{
>> > +       struct symbol *sym;
>> > +       struct menu *child;
>> > +
>> > +       if (!menu_is_visible(menu))
>> > +               return;
>> > +
>> > +       if (verbose && menu == &rootmenu) {
>> > +               printf("\n#\n"
>> > +                      "# Changes:\n"
>> > +                      "#\n");
>> > +       }
>> > +
FWIW, some more nits about this header:
 - I'd rather either always or never see it, not depending on whether
or not KBUILD_VERBOSE is set to non-zero.
 - The "menu == &rootmenu" test is pretty useless, just move the
display (if any) outside of report_conf(), where there is no
ambiguity.
 - And why do you need a leading newline in front of the header (ie.
the "\n#\n") ? The only places where this construct is used in conf is
when there is a need to highlight the message, which should not be
needed here.

>> I would not expect to see any header if there is no new symbol(s).
>> However, that might complicate the code too much. Btw, I find
>> "Changes" to be misleading, is that header necessary ?
>
> We use this feature (or an earlier version of it) in automated kernel
> builds in Debian, so we expect the output to appear in build logs and
> the header makes it easier to pick out.
>
That's easily doable outside kconfig.

 - Arnaud
