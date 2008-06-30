Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.237]:57312 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbYF3Rdt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 13:33:49 -0400
Received: by rv-out-0506.google.com with SMTP id k40so1784430rvb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2008 10:33:49 -0700 (PDT)
Message-ID: <19f34abd0806301033u67796438icb18e429217d4692@mail.gmail.com>
Date: Mon, 30 Jun 2008 19:33:48 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: sed & bzImage issues
In-Reply-To: <20080630161342.GB20736@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19f34abd0806300638pa3770e6xf482ccadd01dcc17@mail.gmail.com>
	 <20080630161342.GB20736@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Jun 30, 2008 at 6:13 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Mon, Jun 30, 2008 at 03:38:28PM +0200, Vegard Nossum wrote:
>> Hello,
>>
>> I just experienced two issues which seem related to kbuild:
>>
>> 1. A 'sed' error (but I've seen it before and it doesn't really matter):
>>
>>   Using xxx/linux-2.6 as source for kernel
>>   CALL    xxx/linux-2.6/scripts/checksyscalls.sh
>> sed: -e expression #1, char 154: Unknown option to 's'
>
> It would be nice to have it fixed (I do not see it here).

It's probably an older version of sed:

$ sed --version
GNU sed version 3.02

(I have 4.1.5 on my usual computer.)

The failed command seems to be:

sed -n -e '/^\#define/ { s/[^_]*__NR_\([^[:space:]]*\).*/\
\#if !defined \(__NR_\1\) \&\& !defined \(__IGNORE_\1\)\
\#warning syscall \1 not implemented\
\#endif/p }' $1

from scripts/checksyscalls.sh.

My sed-fu is not sufficient to pinpoint the exact location of the
error, however ;-)

>> 2. A vanishing bzImage. kbuild claims successful building, but the
>> file isn't there:
>>

...

> Above I do not see any generated files.
> Dod you happen to use make O=... so output files
> are somewhere else and the path in the printout is
> just from another base directory?

Aha! Brilliant, thanks :-)

(Yes, and I forgot about it... :-( I simply assumed that since it said
"this file has just been created", it would also be there by the same
name...)


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
