Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55645 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142Ab1BUFcQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Feb 2011 00:32:16 -0500
MIME-Version: 1.0
In-Reply-To: <20110221045439.GB31194@liondog.tnic>
References: <1298219710-9846-1-git-send-email-bp@alien8.de>
	<20110220175709.GA5178@merkur.ravnborg.org>
	<20110220193906.GC6713@liondog.tnic>
	<1298232047.1284.14.camel@Joe-Laptop>
	<20110221022707.GB18332@liondog.tnic>
	<AANLkTikGb7_1sv8zthkt_5qp4ciGbWHQVupx3MmOjfWJ@mail.gmail.com>
	<20110221045439.GB31194@liondog.tnic>
Date: Mon, 21 Feb 2011 00:32:15 -0500
Message-ID: <AANLkTikEzNnRpgkFPa8aL81syPCxj5fWKKM83gxn-cYQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add extra gcc checks
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Arnaud Lacombe <lacombar@gmail.com>, Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, linux-kbuild@vger.kernel.org

Hi,

On Sun, Feb 20, 2011 at 11:54 PM, Borislav Petkov <bp@alien8.de> wrote:
> On Sun, Feb 20, 2011 at 10:34:57PM -0500, Arnaud Lacombe wrote:
>> Hi,
>>
>> On Sun, Feb 20, 2011 at 9:27 PM, Borislav Petkov <bp@alien8.de> wrote:
>> > On Sun, Feb 20, 2011 at 12:00:47PM -0800, Joe Perches wrote:
>> >> > +EXTRA_CFLAGS += -Wextra -Wno-unused
>> >>
>> >> Why add -Wno-unused ?
>> >>
>> >> If it's because of verbosity, maybe
>> >
>> > Nah, it's because it is too noisy and spits too many false positives.
>> >
>> "too noisy" is a subjective point of view.
>
> Ok, does "too many false positives" objectify it a bit more to your
> taste?
>
The degree of acceptable verbosity should be left to the end user.

>> > For example, it reports the arguments of all those stubs from the
>> > headers which are provided for the else-branch of a CONFIG_* option,
>> > etc.
>> >
>> and by the same way, you silence function marked with
>> `warn_unused_result', unless I misread the manpage.
>
> Can you point me to that passage, I cannot find it in my gcc manpage.
>
my mistake, I just checked, `-Wno-unused' does not affect the
`warn_unused_result' warning. `-Wno-unused-result' is required to
silent that one.

>> If you want to silence something specific, why not just the `no'
>> variant of the thing you do not want ?
>
> Yes, '-Wunused -Wno-unused-parameter' looks better.
>
>> Btw, could you not take the same approach as the one taken by the BSD,
>> which is 3 or 4 different level of new warnings. That way, you keep
>> the noisy stuff for the highest warning level.
>
> Nope, because there's no reason for it. I want to have one switch that
> craps out all the possible warnings gcc can spit, I catch the build
> output, fix the bugs and that's it.
>
Looks like I'll submit the patch implementing multiple warnings level then ;-)

 - Arnaud
