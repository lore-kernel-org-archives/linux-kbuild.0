Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:32906 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751721AbeB0Uzi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Feb 2018 15:55:38 -0500
Received: by mail-wm0-f51.google.com with SMTP id s206so23382522wme.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Feb 2018 12:55:37 -0800 (PST)
Date: Tue, 27 Feb 2018 21:55:23 +0100
From: Robin Jarry <robin.jarry@6wind.com>
Subject: Re: [PATCH v2 3/3] objtool: use global host flags for compilation
Message-ID: <20180227205523.cvzium5loc4km4qh@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com>
 <cover.1519668832.git.robin.jarry@6wind.com>
 <2fa138b613417581eca23afd8741aaf75fbf966a.1519668832.git.robin.jarry@6wind.com>
 <20180227174932.e4pbucnwhducv7xr@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180227174932.e4pbucnwhducv7xr@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

2018-02-27, Josh Poimboeuf:
> On Mon, Feb 26, 2018 at 07:41:48PM +0100, Robin Jarry wrote:
[snip]
> >  ifdef CONFIG_STACK_VALIDATION
> >    has_libelf := $(call try-run,\
> > -		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -,1,0)
> > +	echo "int main() {}" | $(HOSTCC) $(HOSTLDFLAGS) -xc -o /dev/null -lelf -,1,0)
> 
> This should probably also have HOSTCFLAGS, since the objtool makefile
> uses it as well.

I had intentionally omitted HOSTCFLAGS since the compiled code does not
contain any #include statements (only -lelf). But adding them cannot
hurt.

-- 
Robin
