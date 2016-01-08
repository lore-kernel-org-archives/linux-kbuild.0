Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:35533 "EHLO
	mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490AbcAHLtE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jan 2016 06:49:04 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <568F9E1E.7030406@suse.cz>
References: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
	<20160104113318.700a9ed0@lxorguk.ukuu.org.uk>
	<CA+icZUUAoG0VeY06r_=c7aNGbuSkHp5VRHNSB=bQGTiTHShGtQ@mail.gmail.com>
	<568AF421.7050305@suse.cz>
	<CA+icZUWxfbPN4URoVdBAwm22sdKqGmTtiNBEg-KoHi-vgGqzqg@mail.gmail.com>
	<568F9E1E.7030406@suse.cz>
Date: Fri, 8 Jan 2016 12:49:02 +0100
Message-ID: <CA+icZUWMX_C2ME7BT0gkdbPPao_59=ddg6+2E9T3OMfZ0++OQA@mail.gmail.com>
Subject: Re: Thoughts about introducing OPTIMIZATION_CFLAG
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

On Fri, Jan 8, 2016 at 12:31 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 2016-01-08 11:03, Sedat Dilek wrote:
>> On Mon, Jan 4, 2016 at 11:37 PM, Michal Marek <mmarek@suse.cz> wrote:
>>> Dne 4.1.2016 v 12:47 Sedat Dilek napsal(a):
>>>> But I think you did not get my problem - to have two different
>>>> optimization-levels for a compiler in *one* make-line makes no sense
>>>> to me.
>>>
>>> That we sometimes have -O2 ... -Os on the command line is not a problem,
>>> since any same unix tool parses its options so that the last one of
>>> mutually exclusive options wins.
>>
>> That is new to me and I haven't tested this by dropping arguments in
>> my make-line(s).
>>
>> From where do have this information - sort of "business-life-experience" :-)?
>> Is that documented somewhere in the Linux-sources?
>
> You override a previously set option by appending one with different value:
>
> $ yes | head -n 10 -n 999 -n 2
> y
> y
> $
>
> This pattern is used all over in Makefiles.
>
>
>> Do you agree that it is confusing to have two optlevel arguments in
>> one make-line?
>
> It probably is, but fixing this problem would make the Makefiles unreadable.
>
>
>> Linus suggested me to use a wrapper-script in case of using two
>> different compiler and passing arguments...
>>
>> [  /usr/bin/mycompiler ]
>> #!/bin/bash
>>
>> gcc-4.9 "$@"
>> - EOF -
>>
>> According to your statement passing an optlevel here in this script
>> will never-ever be recognized - as it is at the begin-of-(make)-line.
>
> Pass it as the last argument.
>

How do I do that?

- Sedat -

>
>> So how should someone change the Linux-sources to test a different
>> optlevel than -O2?
>
> make KCFLAGS=-O3
>
> However, per-directory and per-file cflags set in Makefiles will take
> precedence. If you want to override these as well, use the wrapper.
>
> Michal
