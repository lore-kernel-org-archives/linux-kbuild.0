Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:53888 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753502Ab0AWC06 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Jan 2010 21:26:58 -0500
Date: Fri, 22 Jan 2010 18:26:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bugme-new] [Bug 15111] New: rpath $ORIGIN useless when path
 contains colon
Message-Id: <20100122182653.7b657b3a.akpm@linux-foundation.org>
In-Reply-To: <bug-15111-10286@http.bugzilla.kernel.org/>
References: <bug-15111-10286@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bugzilla-daemon@bugzilla.kernel.org, bugme-daemon@bugzilla.kernel.org, they4kman@gmail.com


(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

On Sat, 23 Jan 2010 02:11:37 GMT bugzilla-daemon@bugzilla.kernel.org wrote:

> http://bugzilla.kernel.org/show_bug.cgi?id=15111
> 
>            Summary: rpath $ORIGIN useless when path contains colon
>            Product: Process Management
>            Version: 2.5
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Preemption
>         AssignedTo: rlove@rlove.org
>         ReportedBy: they4kman@gmail.com
>         Regression: No
> 
> 
> I am trying to embed Python into the Source (Half-Life 2) game engine. Many
> game server providers place servers in paths containing colons (e.g.,
> /home/srcds/93.76.8.1:27015/). Because of the way my program is called in (it
> is a shared library), the search path does not include the directory my shared
> library is in. Thus, I must use an RPATH and the RPATH variable $ORIGIN, which
> expands to the directory my shared library is in.
> 
> Unfortunately, when $ORIGIN is expanded, it contains a colon, and the runtime
> linker treats it as two individual paths, searching in "/home/srcds/93.76.8.1"
> and "27015/". The game server providers do not allow access to the directory
> where the server is run, so it is inconvenient to place the python25.so there.
> 
> To reproduce this, write any old C program that requires an external library,
> and compile it with the following rpath option:
> -Wl,--rpath,\$$ORIGIN/relative/path/to/library
> 
> Place the executable in a path containing colons, and the external library
> under the directory at the location you specified. When you run the program, it
> will not be able to locate the external library.
> 

