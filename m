Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:52020 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753134Ab0GZPVY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Jul 2010 11:21:24 -0400
Message-ID: <4C4DA7B0.8010401@oracle.com>
Date: Mon, 26 Jul 2010 08:20:16 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: make randconfig fair for booleans
References: <1279801497-810-1-git-send-email-jacmet@sunsite.dk> <20100723211138.GA27379@merkur.ravnborg.org> <4C4D5C7F.2030602@suse.cz> <4C4D9308.3040108@suse.cz>
In-Reply-To: <4C4D9308.3040108@suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kbuild@vger.kernel.org, zippel@linux-m68k.org

On 07/26/10 06:52, Michal Marek wrote:
> On 26.7.2010 11:59, Michal Marek wrote:
>> On 23.7.2010 23:11, Sam Ravnborg wrote:
>>> On Thu, Jul 22, 2010 at 02:24:57PM +0200, Peter Korsgaard wrote:
>>>> Give boolean symbols a 50% chance of getting enabled, rather than 67%.
>>>>
>>>> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>>>
>>> Good catch!
>>>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>
>>> Michal - I assume you apply this for next merge window.
>>
>> Yes, will do. I've been busy (again :)) for the last two weeks, so only
>> reviewed the few patches for .35.
> 
> Applied now.
> 
> CCing Randy. FYI, you'll see a little less builds with CONFIG_MODULES=y
> starting with tomorrow's linux-next. It should not matter unless you're
> maintaining some statistics.

Thanks.  Not a problem.  No stats.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
