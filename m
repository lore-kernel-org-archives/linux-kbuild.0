Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:64652 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbYBKUXu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 15:23:50 -0500
Date: Mon, 11 Feb 2008 12:23:17 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: kconfig creates strange (invalid?) configuration
Message-Id: <20080211122317.60ac7dbe.randy.dunlap@oracle.com>
In-Reply-To: <Pine.LNX.4.64.0802112048070.3378@scrub.home>
References: <20080210143333.GC2436@cs181133002.pp.htv.fi>
	<Pine.LNX.4.64.0802112048070.3378@scrub.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Adrian Bunk <bunk@kernel.org>, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Mon, 11 Feb 2008 21:13:47 +0100 (CET) Roman Zippel wrote:

> Hi,
> 
> On Sun, 10 Feb 2008, Adrian Bunk wrote:
> 
> > The attached .config (with current -git) results in a compile 
> > error since it contains:
> > 
> > CONFIG_X86=y
> > # CONFIG_EMBEDDED is not set
> > CONFIG_SERIO=m
> > CONFIG_SERIO_I8042=y
> > 
> > Looking at drivers/input/serio/Kconfig I simply don't get how this 
> > can happen.
> 
> You've hit the rather subtle rules of select vs default. What happened is 
> that SERIO is selected to m, but SERIO_I8042 isn't selected so the default 
> of y is used instead.
> We already had the problem in the past that select and default don't work 
> well together, so this patch cleans this up and makes the rule hopefully 
> more straightforward. Basically now the value is calculated like this:
> 
> 	(value && dependency) || select
> 
> where the value is the user choice (if available and the symbol is 
> visible) or default.
> 
> In this case it means SERIO and SERIO_I8042 are both set to y due to their 
> default and if SERIO didn't had the default, then the SERIO_I8042 value 
> would be limited to m due to the dependency.
> 
> I tested this patch with more 10000 random configs and above case is the 
> only the difference that showed up, so I hope there is nothing that 
> depended on the old more complex and subtle rules.

Thanks for the explanation.  I was just going to patch/RFC a trivial
patch that fixes the build, but is probably not optimal, even if we
didn't have your patch.  (see below)

---
From: Randy Dunlap <randy.dunlap@oracle.com>

Adrian Bunk pointed out a kernel config file that contained:
CONFIG_X86=y
# CONFIG_EMBEDDED is not set
CONFIG_SERIO=m
CONFIG_SERIO_I8042=y

which happens to cause:

serio.out:ERROR: "i8042_command" [drivers/misc/acer-wmi.ko] undefined!
serio.out:ERROR: "i8042_command" [drivers/leds/leds-clevo-mail.ko] undefined!


The full config file also contains:
# CONFIG_X86_PC is not set
# CONFIG_X86_ELAN is not set
# CONFIG_X86_VOYAGER is not set
# CONFIG_X86_NUMAQ is not set
# CONFIG_X86_SUMMIT is not set
# CONFIG_X86_BIGSMP is not set
# CONFIG_X86_VISWS is not set
CONFIG_X86_GENERICARCH=y
# CONFIG_X86_ES7000 is not set
# CONFIG_X86_RDC321X is not set
# CONFIG_X86_VSMP is not set

and drivers/input/keyboard/Kconfig says:
config KEYBOARD_ATKBD
	tristate "AT keyboard" if EMBEDDED || !X86_PC
	default y
	select SERIO
	select SERIO_LIBPS2
	select SERIO_I8042 if X86_PC
	select SERIO_GSCPS2 if GSC

Changing the !X86_PC to !X86 fixes the build issue.  However, some of the
CONFIG_X86_* variants may not care for it.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/input/keyboard/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.25-rc1.orig/drivers/input/keyboard/Kconfig
+++ linux-2.6.25-rc1/drivers/input/keyboard/Kconfig
@@ -13,7 +13,7 @@ menuconfig INPUT_KEYBOARD
 if INPUT_KEYBOARD
 
 config KEYBOARD_ATKBD
-	tristate "AT keyboard" if EMBEDDED || !X86_PC
+	tristate "AT keyboard" if EMBEDDED || !X86
 	default y
 	select SERIO
 	select SERIO_LIBPS2

