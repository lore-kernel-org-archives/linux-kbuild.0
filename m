Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:8704 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935AbYKYIET (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Nov 2008 03:04:19 -0500
Received: by ey-out-2122.google.com with SMTP id 6so972129eyi.37
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2008 00:04:17 -0800 (PST)
Message-ID: <9b2db90b0811250004k5494cff7sfb22a91e0f6f6ab@mail.gmail.com>
Date: Tue, 25 Nov 2008 10:04:17 +0200
From: "Nir Tzachar" <nir.tzachar@gmail.com>
Subject: Re: [PATCH] ncurses based config V2
In-Reply-To: <Pine.LNX.4.64.0811250333060.13549@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
	 <1220603220-17090-1-git-send-email-nir@tzachar.com>
	 <20080905195930.GA27913@1wt.eu>
	 <20081124184428.GA17085@uranus.ravnborg.org>
	 <Pine.LNX.4.64.0811250333060.13549@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, bzolnier@gmail.com, linux-kbuild@vger.kernel.org, ariveira@gmail.com, rdunlap@xenotime.net, kosaki.motohiro@jp.fujitsu.com, 7eggert@gmx.de

Hello.

On Tue, Nov 25, 2008 at 4:33 AM, Roman Zippel <zippel@linux-m68k.org> wrote:
> Hi,
>
> On Mon, 24 Nov 2008, Sam Ravnborg wrote:
>
>> >   - colors are too dark.
>> Seconded. Please try to find a lighter set of default colors.
>> You may be inspired by one of the menuconfig color-sets.
>>
>> I agree that we could use a lift here - so please do not go for the
>> default color set of menuconfig.
>
> Well, the current colors seems to usable on wide variety of terminals, but
> I'm not colorblind, so I can't really complain. :)
> Before we keep discussing the colors, I'd rather suggest to drop them
> completely and maybe use colors for what actually needs attention.

The idea is using colors to give it a more modern look. Dropping
colors will bring us back to the "dark ages"...

>> >   - I'm not convinced that the parenthesis around hotkeys make the menu
>> >     that much readable, especially when there are lots of short words or
>> >     even acronyms. Eg :
>> >         [ ]   (U)TS namespace
>> >         [ ]   (I)PC namespace
>> >         [ ]   (U)ser namespace (EXPERIMENTAL)
>> >         [ ]   (P)ID Namespaces (EXPERIMENTAL)
>>
>> This looks like some ancient stuff and it must be a better way to
>> show the short-cuts.
>
> The parenthesis make it really annoying to read...

I agree. See my earlier response to Sam.

>> I would really appreciate if you could look into the above issues.
>> If you do a repost with this fixed I will try to do a proper review,
>> including code-review next time.
>
> The code is rather large, so it might be better to split the code into two
> sources, one for kconfig logic and the other for the interface logic, so
> it becomes easier to read and maintain.

Ok.

Thanks for your interest.
Cheers.
