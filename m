Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:64490 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755843Ab0LDVOK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 16:14:10 -0500
Received: by iwn6 with SMTP id 6so1487997iwn.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 13:14:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291496832.8025.79.camel@localhost>
References: <1290488397.6770.1404.camel@localhost>
	<20101203122347.GA12395@sepie.suse.cz>
	<1291482609.8025.57.camel@localhost>
	<AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
	<1291487421.8025.69.camel@localhost>
	<AANLkTik8OgrFRYKF6PS5MkawDDojmF_yEnFtTcnjz4Pp@mail.gmail.com>
	<1291496832.8025.79.camel@localhost>
Date: Sat, 4 Dec 2010 16:14:10 -0500
Message-ID: <AANLkTimTz=AtE6FL-+HDniWwO256yuaqEJyoPWRThYqf@mail.gmail.com>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

On Sat, Dec 4, 2010 at 4:07 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
[...]
>> >> I would not expect to see any header if there is no new symbol(s).
>> >> However, that might complicate the code too much. Btw, I find
>> >> "Changes" to be misleading, is that header necessary ?
>> >
>> > We use this feature (or an earlier version of it) in automated kernel
>> > builds in Debian, so we expect the output to appear in build logs and
>> > the header makes it easier to pick out.
>> >
>> That's easily doable outside kconfig.
>
> No it isn't, as the Kconfig code must be built as part of the
> listnewconfig target.  (Building just the code first will provoke
> warnings about the invalid config.)
>
echo "#"
echo "# Changes:"
echo "#"
make [...] listnewconfig

does the job, without introducing extra header others do not seem to
want to see.

 - Arnaud
