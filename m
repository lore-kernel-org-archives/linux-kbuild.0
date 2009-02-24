Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.235]:37615 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274AbZBXVUE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Feb 2009 16:20:04 -0500
Received: by qb-out-0506.google.com with SMTP id q18so1660736qba.17
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2009 13:20:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20090224210339.GA16943@uranus.ravnborg.org>
References: <b493f8670902241105l48bd7cdbmb99608e802d2454a@mail.gmail.com>
	 <20090224210339.GA16943@uranus.ravnborg.org>
Date: Tue, 24 Feb 2009 16:20:01 -0500
Message-ID: <b493f8670902241320i6b8784abva4e2e1479594647d@mail.gmail.com>
Subject: Re: potential linking bug in recursive directory descent
From: Fred Isaman <iisaman@citi.umich.edu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Feb 24, 2009 at 4:03 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Feb 24, 2009 at 02:05:25PM -0500, Fred Isaman wrote:
>> The pnfs tree base of of 2.6.29-rc5 uses the new find_last_bit
>> function (defined in
>> lib/find_last_bit.c) in a file in the fs/nfs directory.  Myself and
>> another developer (though no one else so far) get the following error
>> during compile:
>>
>>    Kernel: arch/x86/boot/bzImage is ready  (#5)
>>      Building modules, stage 2.
>>      MODPOST 515 modules
>>    ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
>>    make[2]: *** [__modpost] Error 1
>>    make[1]: *** [modules] Error 2
>>    make: *** [sub-make] Error 2
>>
>>
>> Note that find_last_bit() is not used in any file in the fs directory.
>> If I add it to any function that is EXPORT_SYMBOL'ed
>> from the fs directory, suddenly the compile errors go away.  (See the
>> below patch for a more concrete example.)
>>
>> I am not sure what is going on, and why it only affects some
>> developers, but it looks a lot like the kbuild system
>> is deciding that the library does not need to be included at the fs
>> directory level, so isn't including it in fs/nfs where
>> it is needed.
>
> kbuild only links in libaries if there is any users of siad library.
> And your normal config has no users of lib/find_last_bit.c so
> it is not linked into the kernel.
>

I don't understand your comment.  There *is* a user of the library in the
(modified) fs/nfs/nfs4proc.c.  The problem is that it doesn't compile unless
there is also a user in some fs/*.c.

> The general rule is that if any in tree module uses a library
> then the library is always linked in.
> And to always link in a library you need to patch the Makefile
> as Randy suggest in his mail.
>
>        Sam
>

Again, I suspect I am misunderstanding.  It seems you are suggesting
that to compile the nfs code I have to alter lib/Makefile.  While that is a
useful workaround, that is certainly not a viable solution.

Fred
