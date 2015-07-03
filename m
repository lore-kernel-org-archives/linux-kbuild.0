Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35099 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754288AbbGCKQY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 06:16:24 -0400
MIME-Version: 1.0
In-Reply-To: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
Date: Fri, 3 Jul 2015 12:16:23 +0200
Message-ID: <CAEMqcmqzkybD1yYhZWYY=hSDePXbhgV0_w_MMtmUBmD+2EDvwg@mail.gmail.com>
Subject: Re: Kconfig: '+config' valid syntax?
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, Paul Bolle <pebolle@tiscali.nl>, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Ruprecht <andreas.ruprecht@fau.de>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On Thu, Jul 2, 2015 at 10:08 AM, Valentin Rothberg
<valentinrothberg@gmail.com> wrote:
> Hi,
>
> commit ed013214afa7 ("ACPI / init: Make it possible to override _REV")
> is in today's linux-next tree (i.e., next-20150702) adding the
> following hunk to drivers/acpi/Kconfig:
>
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -428,6 +428,26 @@ config XPOWER_PMIC_OPREGION
>         help
>           This config adds ACPI operation region support for XPower AXP288 PMIC.
>
> ++config ACPI_REV_OVERRIDE_POSSIBLE
> +       bool "Allow supported ACPI revision to be overriden"
> +       depends on X86
> +       default y
> [...]
>
> By having a close look at the first added line, we can see that
> '+config ACPI_...' is added.  To my great surprise, it's valid Kconfig
> syntax.  How is that possible?  IMHO it's an invalid token, such that
> Kconfig should complain about it.  Or do I miss something?
>
> Kind regards,
>  Valentin

For another take on this, you could look at the Config._tokenize() function
in Kconfiglib (https://github.com/ulfalizer/Kconfiglib/blob/master/kconfiglib.py).
Here's a relevant comment from that function:

# The initial word on a line is parsed specially. Let
# command_chars = [A-Za-z0-9_]. Then
#  - leading non-command_chars characters are ignored, and
#  - the first token consists the following one or more
#    command_chars characters.
# This is why things like "----help--" are accepted.

The root cause is sloppy lexing in zconf.l, IIRC. I didn't check
whether it's been
improved, but Kconfiglib needs to be backwards compatible either way.

/Ulf
