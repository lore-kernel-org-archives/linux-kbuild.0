Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:46744 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754754AbYB1Kl5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Feb 2008 05:41:57 -0500
From: Richard Hacker <lerichi@gmx.net>
Subject: Re: [PATCH 001/002] scripts/mod/modpost.c: New option -E to load extra symbols
Date: Thu, 28 Feb 2008 11:42:27 +0100
References: <200802280940.53020.lerichi@gmx.net> <20080228091839.GA18519@uranus.ravnborg.org>
In-Reply-To: <20080228091839.GA18519@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802281142.27755.lerichi@gmx.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kai@germaschewski.name, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello Sam,

> At first quick look it looked good and I have only two comments:
> 1) The variable should be named KBUILD_* to fit the general namespace used
I wanted to use the namespace EXTRA_* to continue the line of EXTRA_CFLAGS, 
etc. that were used when building modules. Is that OK? The other names sound 
odd to me: KBUILD_SYMBOLS or KBUILD_EXTRA_SYMBOLS. If you really do not like 
EXTRA_SYMBOLS, which one do you propose?

> 2) The new possibility should be documented in
> Documentation/kbuild/modules.txt
[PATCH 002/002] in this revised series updated scripts/Makefile.modpost to use 
this new feature of modpost, and documented the change as well. Please take a 
look at it: http://lkml.org/lkml/2008/2/28/72

> PS. Please also cc: linux-kbuild@vger.kernel.org if you submit again.
Did it. (For new readers in linux-kbuild: The original patchset can be found 
at:
http://lkml.org/lkml/2008/2/28/71 for [PATCH 001/002]
http://lkml.org/lkml/2008/2/28/72 for [PATCH 002/002] )

- Richard
