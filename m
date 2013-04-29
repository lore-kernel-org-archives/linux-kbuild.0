Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41108 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757279Ab3D2MNe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 08:13:34 -0400
Message-ID: <517E63EA.1020702@suse.cz>
Date: Mon, 29 Apr 2013 14:13:30 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] fix make headers_install when path is too long
References: <513895F9.2050900@windriver.com> <1366994198-30550-1-git-send-email-nicolas.dichtel@6wind.com> <20130426185709.GA13399@merkur.ravnborg.org>
In-Reply-To: <20130426185709.GA13399@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, bruce.ashfield@windriver.com, linux-kbuild@vger.kernel.org

On 26.4.2013 20:57, Sam Ravnborg wrote:
> On Fri, Apr 26, 2013 at 06:36:38PM +0200, Nicolas Dichtel wrote:
>> If headers_install is executed from a deep/long directory structure, the
>> shell's maximum argument length can be execeeded, which breaks the operation
>> with:
>>
>> | make[2]: execvp: /bin/sh: Argument list too long
>> | make[2]: ***
>>
>> Instead of passing each files name with the entire path, I give only the file
>> name without the source path and give this path as a new argument to
>> headers_install.pl.
>>
>> Because there is three possible path, I have tree input-files list, one per
>> path.
>>
>> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
>> ---
>>
>> I come back to this issue. Here is another proposal to fix this pb.
>> Comments are welcome.
>>
>>  scripts/Makefile.headersinst | 20 ++++++++++++++------
>>  scripts/headers_install.pl   |  8 ++++----
> 
> In the kbuild tree the perl script has been replaced by a shell script.
> You should base you patch on the kbuild-tree (or -next).

Yes. Otherwise, the patch looks good. At least until the number of
userspace headers explodes :-).

Michal
