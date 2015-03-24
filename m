Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:39779 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbbCXHjT convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:5:1>);
	Tue, 24 Mar 2015 03:39:19 -0400
Message-Id: <551122B4020000780006CD28@mail.emea.novell.com>
Date: Tue, 24 Mar 2015 07:39:16 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] Kconfig: drop bogus default values
References: <5500584D02000078000688F5@mail.emea.novell.com>
 <178407860.0zoJnDfCo1@tacticalops> <1427145868.10958.5.camel@x220>
 <1565998.uAQ7oZ5VxV@tacticalops>
In-Reply-To: <1565998.uAQ7oZ5VxV@tacticalops>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Martin Walch <walch.martin@web.de>
Cc: akpm@linux-foundation.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

>>> On 23.03.15 at 23:58, <walch.martin@web.de> wrote:
> On Monday 23 March 2015 22:24:28 Paul Bolle wrote:
>> > A real world case is PCI_QUIRKS in the mainline kernel:
>> > 
>> > init/Kconfig:1554:	default y
>> > arch/s390/Kconfig:59:	def_bool n
>> > 
>> > When setting PCI!=n && EXPERT=n then on each architecture PCI_QUIRKS=y
>> > except on s390 where PCI_QUIRKS=n.
>> 
>> Good catch!
>> 
>> For the same effect, would it do to have
>>     config PCI_QUIRKS
>>         default y if !S390
>>         [...]
>> 
>> in init/Kconfig?
> 
> Basically yes (although I suppose the maintainer had a good reason for
> writing it the way it is now). But in the case with "def_bool n" in
> arch/s390/Kconfig, the default value is explicitly set to n, while
> "default y if !S390" does not set the value at all. As long as there are no
> further default lines for PCI_QUIRKS below, this leads to the same
> configuration. However if there was a third default line, then in the former
> case that third default value would be always ignored while in the latter
> case it would determine the default value on s390.

If the "n" default was really needed, it could be

config PCI_QUIRKS
         default !S390

Jan

