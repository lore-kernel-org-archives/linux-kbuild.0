Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35513 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990Ab0LFGoX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Dec 2010 01:44:23 -0500
Message-ID: <4CFC8640.2030105@suse.cz>
Date: Mon, 06 Dec 2010 07:44:16 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [GIT] kbuild and kconfig fixes for 2.6.37-rc5
References: <20101204135732.GA12774@sepie.suse.cz>	<AANLkTimeyo==XJWUaUs8EzJvA8azkk3sw9FXQhMjuo6M@mail.gmail.com> <AANLkTi=95UvsLTUFkS6bsFk9pO_iGgXfeoMf8BOVm0ed@mail.gmail.com>
In-Reply-To: <AANLkTi=95UvsLTUFkS6bsFk9pO_iGgXfeoMf8BOVm0ed@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: trapdoor6@gmail.com, Linus Torvalds <torvalds@linux-foundation.org>, brueckner@linux.vnet.ibm.com, mchehab@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 5.12.2010 17:13, Arnaud Lacombe wrote:
> Hi,
> 
> On Sun, Dec 5, 2010 at 10:42 AM, trapDoor <trapdoor6@gmail.com> wrote:
>> On Sat, Dec 4, 2010 at 1:57 PM, Michal Marek <mmarek@suse.cz> wrote:
>>> Hi Linus,
>>>
>>> please pull these kbuild/kconfig fixes for the next -rc. The largest
>>> part are fixes for the annoying kconfig warnings, contributed by Arnaud
>>> Lacombe and Mauro Carvalho Chehab. The solution adds a new 'visible if'
>>> keyword to the Kconfig language, so it's not exactly something that one
>>> would expect in the rc phase, but the kconfig change is not huge (the
>>> large diff is due to generated files) and it is deployed only in those
>>> five Kconfig files that had the warnings and were hard to fix by other
>>> means.  The second part is a forgotten patch by Hendrik Brueckner to
>>> usr/initramfs, that fixes build for Blackfin and h8300.
>> Hello,
>> I couldn't wait and I merged the changes into my copy of mainline
>> tree. The merge was successful, no conflicts and the merge-diffstat
>> was exactly the same as above. However, when  running oldconfig on the
>> patched kernel I still get lots of warnings:
>>
<sip>
>>
> Technically, this is two warning, though really verbose :)
> 
>>
>> Were these warnings supposed to be fixed by this patch set as well? Or
>> is it something in my config (attached)?
>>
> No. The kconfig language update is meant to be a solution for the +150
> warnings triggered by the media and i2c tree, without making it
> impossible to maintain. The notion of "dependency" was too strong for
> the expected usage.

Yes, sorry for giving false hopes in my mail :-).

Michal
