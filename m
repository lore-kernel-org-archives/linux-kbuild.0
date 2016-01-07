Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from linux-libre.fsfla.org ([208.118.235.54]:40637 "EHLO
	linux-libre.fsfla.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752015AbcAGSy3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2016 13:54:29 -0500
From: Alexandre Oliva <oliva@gnu.org>
Subject: Re: [PATCH] ld-version: fix it on Fedora
References: <1452189189-31188-1-git-send-email-mst@redhat.com>
Date: Thu, 07 Jan 2016 16:42:24 -0200
In-Reply-To: <1452189189-31188-1-git-send-email-mst@redhat.com> (Michael
	S. Tsirkin's message of "Thu, 7 Jan 2016 19:55:24 +0200")
Message-ID: <ormvsh44fj.fsf@livre.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org

On Jan  7, 2016, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fedora 23, ld --version outputs:
> GNU ld version 2.25-15.fc23

> But ld-version.sh fails to parse this

On gnewsense 3, ld --version outputs:

GNU ld (GNU Binutils for Debian) 2.20.1-system.20100303
Copyright [...]

The date at the end severely confuses the version parser.

Furthermore, awk is mawk, whose gsub takes ')' as grouping, so it
complains about the missing '('.

Also, once a[1] is multiplied by 1e7, mawk's print spits out the number
in exponential notation, which confuses the -lt test.  In order to avoid
that falling back to floating-point numbers, I've used smaller
multipliers and concatenated (truncated) integers.  Yuck.

I've modified the script so that it takes the - as a separator too, and
so that it works on both gawk and mawk.  Here's the ld-version.sh that
worked for me.  I guess this will have to be combined with your patch
somehow.

#!/usr/bin/awk -f
# extract linker version number from stdin and turn into single number
        {
        gsub(".*[)]", "");
        split($1,a, "[-.]");
        printf "%i%04i\n", a[1]*10000 + a[2]*100 + a[3], (a[4]*100 + a[5])%10000;
        exit
        }

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
