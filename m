Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:62045 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751440AbaFEBxH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jun 2014 21:53:07 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH 0/2] kconfig: fix multi-byte UTF handling in nconfig
Date: Thu, 05 Jun 2014 03:53:02 +0200
Message-ID: <3051827.bgi1sztfBs@tacticalops>
In-Reply-To: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>

On Wednesday 04 June 2014 00:52:29 Brian Norris wrote:
> The second is inspired by a long-standing bugzilla entry:
> 
>   https://bugzilla.kernel.org/show_bug.cgi?idC067
> 
> The MTD_NAND_CAFE Kconfig symbol (drivers/mtd/nand/Kconfig) has description
> text which uses a multi-byte UTF-8 character: the 'É' in 'CAFÉ'. This
> character (and other similar >8bit UTF-8 characters) is not handled
> correctly by many of the kernel configuration tools (notably 'make nconfig'
> and 'make xconfig'). nconfig was especially broken, as it would completely
> drop any menu entry which had non-ASCII characters, as well as ALL
> subsequent entries in the same window (!!).

Hi,

so far I have not seen any solid hint that the configuration system was
designed with support for anything beyond 7 bit ASCII characters in mind.
Except some "of course we use UTF-8 for everything in the 21st century"
ranting, I have also not seen any commonly accepted decision that it should
use any other character set.

Currently there are 14145 symbols in the mainline kernel and I know of only
two that do not use exclusively 7 bit ASCII characters. One is MTD_NAND_CAFE
which prompts with "NAND support for OLPC CAFÉ chip" and reads in the help
text "Use NAND flash attached to the CAFÉ chip designed for the OLPC
laptop.", the other one is HID_XINMO, which has a UTF-8 "no brake space" in
the help text "[..]Say Y here[..]" (after the Y). I guess the latter one
is only accidentally there.

One reason for this is probably that there is currently no reliable UTF-8
support in the configuration system. Of course, this does not answer the
question whether Kconfig files should accept UTF-8 characters or not.

IMO such a change (use UTF-8) should be consented by a wide audience, because
it affects every user of the configuration system, and in particular every
kernel developer.

As I am no expert for character encoding, please correct me if I am wrong
with anything of the following.

While I think that using UTF-8 is often a good idea, I also think that it is
a bad idea to just hack UTF-8 support into the configuration system without
careful consideration and code review: ASCII is a least common denominator
that is compatible with most character sets in regular use. Currently it
hardly matters what character encoding the terminal uses and what the
font supports as long as it is 7 bit ASCII compatible.

As far as I see, deciding for UTF-8 is an "all-in" thing. It is not feasible
to then allow anything beside UTF-8. This will force any user to use a
terminal and a font that support UTF-8.

For UTF-8 support, the whole code base of the configuration system should
be revisited, because as far as I know it currently makes in some places the
assumption that the size of one character equals sizeof(char), although most
of the time this will not hurt.

Furthermore, consistent UTF-8 support is hard with flex as it does not really
support wide characters. Of course you can make flex accept them, but a
16 bit character will be treated as two 8 bit characters. In flex, this is
probably not too much of a drawback, but it is ugly.

Assumed that UTF-8 is the preferred character encoding, where should this
apply? Only in help texts? Also in comments and in menu prompts? How about
expansion variables? Default values? Symbol names? (the latter would force
the C preprocessor to use that character set, which will probably not happen)

Anyway, I think it would help to have a clear specification (i.e. a
documented decision), no matter if with or without UTF-8.

Regards,
Martin Walch
-- 

