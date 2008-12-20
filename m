Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f21.google.com ([209.85.218.21]:33398 "EHLO
	mail-bw0-f21.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250AbYLTCCh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Dec 2008 21:02:37 -0500
Message-ID: <f19298770812191802g5dfbdbe3hf2ff63f66979fe7c@mail.gmail.com>
Date: Sat, 20 Dec 2008 05:02:34 +0300
From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
Subject: Re: GIT head doesn't seem to want to build on 32bit..
In-Reply-To: <20081217113029.GB5027@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081216172859.5bc030b6@lxorguk.ukuu.org.uk>
	 <alpine.LFD.2.00.0812160946410.14014@localhost.localdomain>
	 <20081216181133.2342b49e@lxorguk.ukuu.org.uk>
	 <20081216183817.GA25108@uranus.ravnborg.org>
	 <20081217100727.5cf6248c@lxorguk.ukuu.org.uk>
	 <20081217113029.GB5027@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Dec 17, 2008 at 14:30, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Dec 17, 2008 at 10:07:27AM +0000, Alan Cox wrote:
>>
>> > Smells like a kbuild issue.
>> > Please copy me and linux-kbuild@vger.kernel.org on any findings.
>> >
>> > [My 64 bit toolchain is br0ken atm so I could not try to reproduce]
>>
>> Yes I do indeed need to build x86_64 first, then make distclean or
>> mrproper and then 32bit build fails
>
> I will fix my 64 bit build soonish.
> In the meantime could someone do:
>

I can't reproduce this on a 64-bit host no matter what I do.
Alan, could you please provide your 64-bit .config?
Also, I could give Sam ssh to this machine.
