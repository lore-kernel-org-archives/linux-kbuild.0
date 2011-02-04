Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:61130 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab1BDICS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Feb 2011 03:02:18 -0500
Message-ID: <4D4BB286.6090500@gmail.com>
Date: Fri, 04 Feb 2011 09:02:14 +0100
From: =?ISO-8859-1?Q?Nicolas_de_Peslo=FCan?=
	<nicolas.2p.debian@gmail.com>
MIME-Version: 1.0
Subject: Re: 2.6.38-rc3 - make deb-pkg bombs out
References: <19784.18282.668305.184521@quad.stoffel.home> <19787.9875.652.181110@quad.stoffel.home>
In-Reply-To: <19787.9875.652.181110@quad.stoffel.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stoffel <john@stoffel.org>
Cc: linux-kernel@vger.kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org

Le 03/02/2011 23:05, John Stoffel a écrit :
>>>>>> "John" == John Stoffel<john@stoffel.org>  writes:
>
> I've updated this email to include the maintainer and the linux-kbuild
> mailing list.
>
> John>  I've been trying to do a 'make deb-pkg' on 2.6.38-rc? and not
> John>  having any luck.  I was going to report this error for -rc2, but
> John>  saw -rc3 this morning so I grabbed it and tried it out.
>
> John>  I can successfully build the kernel on x86_64 (Ubuntu 10.10
> John>  system, dual core Athlon, 4gb RAM, current directory mounted via
> John>  NFS), but when I do:
>
> John>    fakeroot make O=/var/tmp/build deb-pkg
>
> Turns out the problem is with the "O=/var/tmp/build" since it works to
> build the deb-pkg target in the current directory just fine, using the
> same .config and same arguements.
>
> I guess I'll start to bisect this and see when it last worked.
> Looking at the scripts/package/builddeb script, it just needs to be
> updated to use the O=/some/path in the find command.  I think.  But I
> don't know the build system at all.

Hi John,

I submitted a patch that fix this problem on January 24th.

http://www.spinics.net/lists/linux-kbuild/msg04131.html

Despite a Tested-by: and an Acked-by:, this patch apparently didn't reach main line until now.

	Nicolas.
