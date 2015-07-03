Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20]:38583 "EHLO
	mx-rz-1.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754635AbbGCJ3L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 05:29:11 -0400
Message-ID: <559655E3.6010400@fau.de>
Date: Fri, 03 Jul 2015 11:29:07 +0200
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
MIME-Version: 1.0
Subject: Re: Kconfig: '+config' valid syntax?
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>		 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de>	 <1435839005.2423.28.camel@tiscali.nl> <55963AD7.3040905@fau.de> <1435913987.2423.38.camel@tiscali.nl>
In-Reply-To: <1435913987.2423.38.camel@tiscali.nl>
Content-Type: multipart/mixed;
 boundary="------------090503070908050907020506"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

This is a multi-part message in MIME format.
--------------090503070908050907020506
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 07/03/2015 10:59, Paul Bolle wrote:
> On vr, 2015-07-03 at 09:33 +0200, Andreas Ruprecht wrote:
>> I tested the behaviour on yesterday's linux-next, but the commit
>> mentioned above will only complain for invalid characters inside the
>> PARAM case and not for COMMANDs. So, as an example, if you write
>> something like
>>
>> config ACPI_REV_OVERRIDE_POSSIBLE
>> 	depends on X86 +
>> [...]
>>
>> Kconfig will complain about the '+'. This, however, does not apply for
>> top-level statements like 'config', 'menuconfig', and so on.
> 
> Which might explain why this silly mistake went unnoticed. (And, as I
> think you implied, it doesn't help that the empty rule we're hitting
> here is not commented.)
> 
> So the naive solution seems to be to also add the warning to COMMAND's
> rule for '.'. A quick test suggest that would work. Am I missing some
> obvious downside with that solution?

Well, as I mentioned earlier, with a patch similar to the one below this
warning is also generated three times for every '---' before 'help'.
This results in a giant pile of warnings:

ruprecht@box:linux-next$ rm -f scripts/kconfig/*_shipped &&
REGENERATE_PARSERS=1 make allyesconfig 2>&1 | wc -l
7419

The output looks like this:
scripts/kconfig/conf  --allyesconfig Kconfig
arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
arch/x86/Kconfig:4:warning: ignoring unsupported character '-'
init/Kconfig:222:warning: ignoring unsupported character '-'
init/Kconfig:222:warning: ignoring unsupported character '-'
init/Kconfig:222:warning: ignoring unsupported character '-'
init/Kconfig:244:warning: ignoring unsupported character '-'
init/Kconfig:244:warning: ignoring unsupported character '-'
init/Kconfig:244:warning: ignoring unsupported character '-'
[...]

So we would need to add special treatment for '-' also in the command
case, right? But that doesn't look appealing to me, more like a dirty,
dirty hack around the actual problem...

Regards,

Andreas


--------------090503070908050907020506
Content-Type: text/x-patch;
 name="zconf.l.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="zconf.l.patch"

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 200a3fe..642f5b2 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -106,7 +106,11 @@ n	[A-Za-z0-9_]
 		zconflval.string =3D text;
 		return T_WORD;
 	}
-	.
+	.	{
+		fprintf(stderr,
+		        "%s:%d:warning: ignoring unsupported character '%c'\n",
+		        zconf_curname(), zconf_lineno(), *yytext);
+	}
 	\n	{
 		BEGIN(INITIAL);
 		current_file->lineno++;

--------------090503070908050907020506--
