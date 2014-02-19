Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:64375 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753977AbaBSSGJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Feb 2014 13:06:09 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so723136pbb.17
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Feb 2014 10:06:08 -0800 (PST)
Message-ID: <5304F28D.5070604@converseincode.com>
Date: Wed, 19 Feb 2014 10:06:05 -0800
From: Behan Webster <behanw@converseincode.com>
MIME-Version: 1.0
Subject: Re: linux-next
References: <5303C695.4030403@converseincode.com>	<20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au>	<53041454.6090404@converseincode.com>	<20140219060717.GA25806@ravnborg.org>	<53044B35.3010203@converseincode.com> <20140219172223.9b107d24c1e5a708a1e3cece@canb.auug.org.au>
In-Reply-To: <20140219172223.9b107d24c1e5a708a1e3cece@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, =?ISO-8859-1?Q?Jan-Simon_M=F6ller?= <dl9pf@gmx.de>

On 02/18/14 22:22, Stephen Rothwell wrote:
> Hi,
>
> On Tue, 18 Feb 2014 22:12:05 -0800 Behan Webster <behanw@converseincode.com> wrote:
>> Yes. The plan is to send them to the list. Just haven't got to it yet.
>> Sorry for the confusion.
>>
>> Like I said, at this point I was just asking about linux-next inclusion,
>> and how that all worked.
> OK, I should have said that linux-next is for patches that have passed
> review and unit testing and are essentially ready to go to Linus (or your
> upstream tree).
Then we're down to just the thinkpad ACPI nested functions patch which 
fits those criteria.

I will remove the other patches (since they haven't been reviewed by the 
appropriate kernel community yet), and we will only add patches to that 
branch that satisfy those rules.

Thanks,

Behan

-- 
Behan Webster
behanw@converseincode.com

