Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:33497 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799Ab1HKUoc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Aug 2011 16:44:32 -0400
Date: Thu, 11 Aug 2011 22:44:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic
	reorg
Message-ID: <20110811204430.GA22891@merkur.ravnborg.org>
References: <20110811132516.GQ2203@ZenIV.linux.org.uk> <20110807204118.GA2203@ZenIV.linux.org.uk> <4E4254E1.5070909@suse.cz> <CA+55aFy9_menekFnwEPFVYb493m-_77HibPL4VXfd6-Jh4rzLA@mail.gmail.com> <201108111516.44243.arnd@arndb.de> <18536.1313072440@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18536.1313072440@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

> 
>  (*) I'd also prefer to use #include_next and move the uapi/ directories out of
>      the include/ directories:
> 
> 	include/uapi/ -> uapi/
> 	arch/foo/include/uapi/ -> arch/foo/uapi/
> 
>      as it seems cleaner, especially as there's then no need to #include
>      <uapi/...> anywhere - but various people object to the use of
>      #include_next, though the kernel does already use it.

#include_next is only used by mips. This has no relevance for a "do use",
or "do not use" decision.

	Sam
