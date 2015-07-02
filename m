Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35270 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753063AbbGBIJH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 04:09:07 -0400
MIME-Version: 1.0
From: Valentin Rothberg <valentinrothberg@gmail.com>
Date: Thu, 2 Jul 2015 10:08:36 +0200
Message-ID: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
Subject: Kconfig: '+config' valid syntax?
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rafael.j.wysocki@intel.com, Paul Bolle <pebolle@tiscali.nl>, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Ruprecht <andreas.ruprecht@fau.de>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

Hi,

commit ed013214afa7 ("ACPI / init: Make it possible to override _REV")
is in today's linux-next tree (i.e., next-20150702) adding the
following hunk to drivers/acpi/Kconfig:

--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -428,6 +428,26 @@ config XPOWER_PMIC_OPREGION
        help
          This config adds ACPI operation region support for XPower AXP288 PMIC.

++config ACPI_REV_OVERRIDE_POSSIBLE
+       bool "Allow supported ACPI revision to be overriden"
+       depends on X86
+       default y
[...]

By having a close look at the first added line, we can see that
'+config ACPI_...' is added.  To my great surprise, it's valid Kconfig
syntax.  How is that possible?  IMHO it's an invalid token, such that
Kconfig should complain about it.  Or do I miss something?

Kind regards,
 Valentin
