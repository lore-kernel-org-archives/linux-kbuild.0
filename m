Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from isrv.corpit.ru ([81.13.33.159]:51834 "EHLO isrv.corpit.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761085AbZJMTUa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Oct 2009 15:20:30 -0400
Message-ID: <4AD4D2D8.5000904@msgid.tls.msk.ru>
Date: Tue, 13 Oct 2009 23:19:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [GIT PULL] kbuild fixes
References: <20091011221818.GA2833@merkur.ravnborg.org> <4AD2EBC6.1000505@msgid.tls.msk.ru> <20091013185841.GC5249@merkur.ravnborg.org>
In-Reply-To: <20091013185841.GC5249@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Sam Ravnborg wrote:
> On Mon, Oct 12, 2009 at 12:41:42PM +0400, Michael Tokarev wrote:
>> Sam Ravnborg wrote:
>>> Hi Linus.
>>>
>>> A few kbuild related fixes.
>> []
>>> - Fix use of echo -ne. Is caused issues for ubuntu (IIRC) users
>> As has been discussed previously (and Sam has been CC'ed), the fix
>> is still incorrect.
> 
> In the thread hpa asked for a patch at least twice.
> Only after I submitted -fixes to Linus it shows up.
> 
> Bad timing.
> 
> And please - do not even think of asking me to do it.

How many patches should one send? How many trees one should
compare against and send different patch for, in case such
an obvious trivial cases?  If I'll provide this against
mainline, it wont apply to Sam's tree.  If against Sam's
tree, it wont apply to mainline.  And for such trivial
cases, it's just amusing to expect full patch.

It's not bad timing.  I needed to know which damn tree
I should diff against.  In Sam's pull request I found
the - hopefully - correct tree.

Please don't even think I will be submitting something like
this again.  I spent half a week debugging a mysterious issue,
and I provided at least information in hope it will be useful
to someone with the same issue.  And it turns out that by doing
so, *I* owe something to everyone else.  It's not how things
works, or SHOULD work.

Thanks.

/mjt

> You guys are the one that see the issue, who know how to fix it,
> and knows how to check that the fix really works.
> 
> In other words - provide a patch next time you are asked to do so.
> 
> I'm off for much needed vacation rest of the week and
> may rememeber to handle the patch when I get back...
> 
> 	Sam

