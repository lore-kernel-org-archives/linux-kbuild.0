Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53882 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752007AbbASMul (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Jan 2015 07:50:41 -0500
Message-ID: <54BCFD9F.3080906@suse.cz>
Date: Mon, 19 Jan 2015 13:50:39 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] kconfig: don't silently ignore unhandled characters
References: <54B93FE60200007800055E84@mail.emea.novell.com> <1421425532.8562.32.camel@x220> <54B94B3E0200007800055F77@mail.emea.novell.com>
In-Reply-To: <54B94B3E0200007800055F77@mail.emea.novell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Bolle <pebolle@tiscali.nl>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On 2015-01-16 17:32, Jan Beulich wrote:
>>>> On 16.01.15 at 17:25, <pebolle@tiscali.nl> wrote:
>> On Fri, 2015-01-16 at 15:44 +0000, Jan Beulich wrote:
>>>  scripts/kconfig/zconf.l             |    7 +
>>>  scripts/kconfig/zconf.lex.c_shipped |  195 +++++++++++++++++++-----------------
>>>  sound/soc/intel/Kconfig             |    4 
>>
>> I guess Michal would like to split the c_shipped changes in this patch
>> too. (I personally don't care.)

The change to zconf.l is rather simple (and .l sorts before .lex :)), so
it's not a big issue here.


>> And I think the sound/soc/intel/Kconfig
>> should be a separate patch. 

Yes, that would be nice.


> I simply didn't want the patch to create fallout (even if it's just
> warnings). If doing this here is deemed inappropriate, I'd likely
> drop the adjustment altogether

Since it is a trivial cleanup, you can submit it as as another patch in
this series.

Michal
