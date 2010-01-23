Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:37414 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754798Ab0AWM7W (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 Jan 2010 07:59:22 -0500
Message-ID: <4B5AF2A9.3020103@suse.cz>
Date: Sat, 23 Jan 2010 13:59:21 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [Bugme-new] [Bug 15111] New: rpath $ORIGIN useless when path
 contains colon
References: <bug-15111-10286@http.bugzilla.kernel.org/> <20100122182653.7b657b3a.akpm@linux-foundation.org>
In-Reply-To: <20100122182653.7b657b3a.akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: they4kman@gmail.com
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, bugzilla-daemon@bugzilla.kernel.org, bugme-daemon@bugzilla.kernel.org

> On Sat, 23 Jan 2010 02:11:37 GMT bugzilla-daemon@bugzilla.kernel.org wrote:
>> I am trying to embed Python into the Source (Half-Life 2) game engine. Many
>> game server providers place servers in paths containing colons (e.g.,
>> /home/srcds/93.76.8.1:27015/). Because of the way my program is called in (it
>> is a shared library), the search path does not include the directory my shared
>> library is in. Thus, I must use an RPATH and the RPATH variable $ORIGIN, which
>> expands to the directory my shared library is in.
>>
>> Unfortunately, when $ORIGIN is expanded, it contains a colon, and the runtime
>> linker treats it as two individual paths, searching in "/home/srcds/93.76.8.1"
>> and "27015/". The game server providers do not allow access to the directory
>> where the server is run, so it is inconvenient to place the python25.so there.

That's an issue of the runtime linker (ld.so, part of glibc), it has
nothing to do with the kernel. Or am I missing something?


Michal
