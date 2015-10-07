Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34453 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752352AbbJGXIr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Oct 2015 19:08:47 -0400
MIME-Version: 1.0
In-Reply-To: <20151006092231.GC2681@nebuchadnezzar.informatik.uni-erlangen.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1443026498-15081-1-git-send-email-mcgrof@do-not-panic.com>
 <20151004134247.GA7528@nebuchadnezzar> <20151005230317.GQ14464@wotan.suse.de>
 <20151006081912.GA2681@nebuchadnezzar.informatik.uni-erlangen.de>
 <1444120375.2417.10.camel@tiscali.nl> <20151006092231.GC2681@nebuchadnezzar.informatik.uni-erlangen.de>
From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Date: Wed, 7 Oct 2015 16:08:27 -0700
Message-ID: <CAB=NE6WZb481Wvq63K_OMn_chr-ObvozxaVv==xYn+Yn36FkKA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: document recursive dependency limitation / resolution
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.com>, Josh Triplett <josh@joshtriplett.org>, jbottomley@odin.com, Geert Uytterhoeven <geert@linux-m68k.org>, Herbert Xu <herbert@gondor.apana.org.au>, Takashi Iwai <tiwai@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roberto Di Cosmo <roberto@dicosmo.org>, Stefano Zacchiroli <zack@upsilon.cc>, =?UTF-8?B?TcOhdMOpIFNvw7Nz?= <soos.mate@gmail.com>, skl@det.ua.pt, iouliia@det.ua.pt, Armin Biere <biere@jku.at>, Julia Lawall <julia.lawall@lip6.fr>, ziegler@cs.fau.de, Chi Pham <chidaph@gmail.com>

On Tue, Oct 6, 2015 at 2:22 AM, Valentin Rothberg
<valentinrothberg@gmail.com> wrote:
> Hi Paul,
>
> On Oct 06 '15 10:32, Paul Bolle wrote:
>> Hi Valentin,
>>
>> On di, 2015-10-06 at 10:19 +0200, Valentin Rothberg wrote:
>> > I think that a general remark that using selects should be discouraged
>> > as, besides causing the recursive issue, selects can also break
>> > dependencies.
>>
>> How do selects break dependencies?
>
> Consider the following example (I also attached it as a path):
>
> config A
>     bool "CONFIG A"
>
> config B
>     bool "CONFIG B"
>     depends on !A
>
> config C
>     bool "CONFIG C"
>     depends on A
>     select B
>
> The option B and C are clearly contradicting with respect to A.
> However, when A is set, C can be set as well because Kconfig does not
> visit the dependencies of the select target (in this case B).  And since
> Kconfig does not visit the dependencies, it breaks the dependencies of B
> (!A).
>
> You can test the example after applying the patch via:
>    $ make KBUILD_KCONFIG=bad_selects.Kconfig menuconfig
>
> Set A, then set C and you'll see that B is set to 'y' as well.

I'll add a form of this example into my patch as well... I'll respin
next. I've decided to take out all of the SAT solving discussion and
text and throw it into a wiki. We now also have quite a bit of
interest from mentors and at least one developer who might be
interested in this work. I'll Cc them and provide the wiki URL and
mailing list that can be used for further discussions / ideas on SAT
solver - kconfig integration.

 Luis

 Luis
