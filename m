Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.24]:37979 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760141AbZJMPL3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Oct 2009 11:11:29 -0400
MIME-Version: 1.0
In-Reply-To: <4AD2EBC6.1000505@msgid.tls.msk.ru>
References: <20091011221818.GA2833@merkur.ravnborg.org>
	 <4AD2EBC6.1000505@msgid.tls.msk.ru>
Date: Tue, 13 Oct 2009 23:10:19 +0800
Message-ID: <2375c9f90910130810w2d887dd2uea0f4bc88ac2d894@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild fixes
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Oct 12, 2009 at 4:41 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Sam Ravnborg wrote:
>>
>> Hi Linus.
>>
>> A few kbuild related fixes.
>
> []
>>
>> - Fix use of echo -ne. Is caused issues for ubuntu (IIRC) users
>
> As has been discussed previously (and Sam has been CC'ed), the fix
> is still incorrect.  It replaces "echo -ne" with "/bin/echo -ne",
> but neither of the two are guaranteed to support the necessary
> arguments and necessary (hexadecimal) escape sequences.  What should
> be used here is printf(1).  The trivial patch below (on top of these
> kbuild changes) fixes this issue.
>
> Thanks.
>
> /mjt
>
> Signed-Off-By: Michael Tokarev <mjt@tls.msk.ru>
>

Sorry, I just saw this email.

Hmm, printf(1) should be more portable than echo(1), I checked your patch,
how about using 'printf "%b" ' instead?

Thanks!
