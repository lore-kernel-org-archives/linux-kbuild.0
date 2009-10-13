Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:39555 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636AbZJMUVT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Oct 2009 16:21:19 -0400
Date: Tue, 13 Oct 2009 22:20:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [GIT PULL] kbuild fixes
Message-ID: <20091013202036.GA5373@merkur.ravnborg.org>
References: <20091011221818.GA2833@merkur.ravnborg.org> <4AD2EBC6.1000505@msgid.tls.msk.ru> <20091013185841.GC5249@merkur.ravnborg.org> <4AD4D2D8.5000904@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4AD4D2D8.5000904@msgid.tls.msk.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Oct 13, 2009 at 11:19:52PM +0400, Michael Tokarev wrote:
> Sam Ravnborg wrote:
>> On Mon, Oct 12, 2009 at 12:41:42PM +0400, Michael Tokarev wrote:
>>> Sam Ravnborg wrote:
>>>> Hi Linus.
>>>>
>>>> A few kbuild related fixes.
>>> []
>>>> - Fix use of echo -ne. Is caused issues for ubuntu (IIRC) users
>>> As has been discussed previously (and Sam has been CC'ed), the fix
>>> is still incorrect.
>>
>> In the thread hpa asked for a patch at least twice.
>> Only after I submitted -fixes to Linus it shows up.
>>
>> Bad timing.
>>
>> And please - do not even think of asking me to do it.
>
> How many patches should one send? How many trees one should
> compare against and send different patch for, in case such
> an obvious trivial cases?  If I'll provide this against
> mainline, it wont apply to Sam's tree.
mainline - a replacement patch would have been
what I had expected to see.

I took you patch and gave it a hopefully proper
subject and applied it to kbuild-fixes.git.

	Sam
