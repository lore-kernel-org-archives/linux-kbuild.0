Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:33639 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215AbbGFIcl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jul 2015 04:32:41 -0400
MIME-Version: 1.0
From: Valentin Rothberg <valentinrothberg@gmail.com>
Date: Mon, 6 Jul 2015 10:32:11 +0200
Message-ID: <CAD3Xx4LLYr-en1atZkj-qxQ=yDMi238eyryuZoxu2Spuxb8ACA@mail.gmail.com>
Subject: Kconfig symbols: coding style: naming convention in Make and CPP syntax
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, akpm@linux-foundation.org, sfr@canb.auug.org.au, apw@canonical.com, joe@perches.com

Hi,

Kconfig symbols in Make and CPP syntax are prefixed with 'CONFIG_' and
suffixed with '_MODULE' in case of modules.  Static analysis tools
like scripts/checkkconfigsymbols.py, the Undertaker tools [1] or
Paul's perl monster rely on the assumption that 'CONFIG_' prefixed
symbols must be defined somewhere in a Kconfig file.  Sadly, this
naming convention is not  explicitly written down in any documentation
file.  Hence there are more than 250 cases in the source where
'CONFIG_' prefixed symbols are defined outside Kconfig (e.g., #define
CONFIG_IRQ_REQ [..] in drivers/pcmcia/cs_internal.h).  To give an
example, 65 of such cases are newly introduced with the gigantic AMD
driver mentioned in Linus' v4.2-rc1 log.

Since the naming convention is not made explicit, it can be hard to
convince people of not using the 'CONFIG_' prefix.  So here is my
question/proposal:  Do you agree on making the 'CONFIG_'  naming
convention explicit (e.g., in Documentation/CodingStyle)?  It would
simplify the life of people who check git trees for Kconfig issues and
report them, because a pointer to an explicit rule is more convincing
than explaining how Kbuild transforms a .config file.

Kind regards,
 Valentin

[1] https://undertaker.cs.fau.de/
