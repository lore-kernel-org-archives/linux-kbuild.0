Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.172]:47794 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbYKYMfi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Nov 2008 07:35:38 -0500
Received: by ug-out-1314.google.com with SMTP id 39so1062820ugf.37
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2008 04:35:36 -0800 (PST)
Message-ID: <9b2db90b0811250435x39572d88s4b5d3d5da5201b8@mail.gmail.com>
Date: Tue, 25 Nov 2008 14:35:36 +0200
From: "Nir Tzachar" <nir.tzachar@gmail.com>
Subject: Re: [PATCH] ncurses based config V2
In-Reply-To: <20081125081153.GA12275@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
	 <1220603220-17090-1-git-send-email-nir@tzachar.com>
	 <20080905195930.GA27913@1wt.eu>
	 <20081124184428.GA17085@uranus.ravnborg.org>
	 <9b2db90b0811250001k6e0c609frca073f3221a3e8ed@mail.gmail.com>
	 <20081125081153.GA12275@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Willy Tarreau <w@1wt.eu>, Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, bzolnier@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, ariveira@gmail.com, rdunlap@xenotime.net, kosaki.motohiro@jp.fujitsu.com, 7eggert@gmx.de

Hi.

On Tue, Nov 25, 2008 at 10:11 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Nir.
>
>> >>         [ ]   (U)TS namespace
>> >>         [ ]   (I)PC namespace
>> >>         [ ]   (U)ser namespace (EXPERIMENTAL)
>> >>         [ ]   (P)ID Namespaces (EXPERIMENTAL)
>> >
>> > This looks like some ancient stuff and it must be a better way to
>> > show the short-cuts.
>>
>> This was the best I could come up with, as ncurses does not let you
>> use color attributed for menu items. I'll try a different scheme,
>> where the first capitalized letter is the shortcut. What do u say?
>
> Better than the above - let me see it in action and I will judge.
> I had preferred something with a colored highlight - but if ncurses
> do not support that then I think first catital letter i ok.
>
> Alternative is to use first letter in the prompt and accept the
> ambiguity.
>

There is too much ambiguity here -- what if the first letter is 'm'?
or 'n'? you have problems then.

>> > I would really appreciate if you could look into the above issues.
>> > If you do a repost with this fixed I will try to do a proper review,
>> > including code-review next time.
>>
>> Sure. I'll have a patch ready in a few days.
>
> Great - loks forward to see it.
>
>        Sam
>
