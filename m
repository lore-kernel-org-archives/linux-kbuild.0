Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]:20805
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751365Ab2C0XA0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Mar 2012 19:00:26 -0400
Message-ID: <4F724658.6010404@am.sony.com>
Date: Tue, 27 Mar 2012 15:59:36 -0700
From: Frank Rowand <frank.rowand@am.sony.com>
Reply-To: <frank.rowand@am.sony.com>
MIME-Version: 1.0
Subject: Re: [PATCH] modpost: Fix modpost's license checking V3
References: <CACqU3MUXAOMGQ1nzUrtYPEQAC3U-nuq3YurtNJJLS1hft4ROGA@mail.gmail.com>	<1310626276-4541-1-git-send-email-abogani@kernel.org>	<4F6D2BC5.9070200@am.sony.com>	<4F711EC0.3080708@am.sony.com> <CAPk1OjELnXiZVreaEh94e3RT306mmkQxxyg2DH5aYy=rQ9yr1w@mail.gmail.com>
In-Reply-To: <CAPk1OjELnXiZVreaEh94e3RT306mmkQxxyg2DH5aYy=rQ9yr1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: "Rowand, Frank" <Frank_Rowand@sonyusa.com>, Rusty Russell <rusty@rustcorp.com.au>, Jan Beulich <jbeulich@novell.com>, Kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Bird, Tim" <Tim.Bird@am.sony.com>, Anders Kaseorg <andersk@ksplice.com>, Arnaud Lacombe <lacombar@gmail.com>

On 03/27/12 00:19, Alessio Igor Bogani wrote:
> Dear Mr. Rowand,
> 
> Il 27 marzo 2012 03:58, Frank Rowand <frank.rowand@am.sony.com> ha scritto:
>> On 03/23/12 19:04, Frank Rowand wrote:
>>> On 07/13/11 23:51, Alessio Igor Bogani wrote:
>>>> The commit f02e8a6 sorts symbols placing each of them in its own elf section.
>>>> The sorting and merging into the canonical sections are done by the linker.
>>>> Unfortunately modpost to generate Module.symvers file parses vmlinux
>>>
>>> Yet another unfortunately: modpost parses vmlinux.o instead of vmlinux (vmlinux
>>> does not yet exist at this point of the build).  vmlinux.o also does not have
>>> the many sections sorted and merged into the canonical sections.  As a result,
>>> the Module.symvers created my modpost incorrectly reports the license of all
>>> exports as "(unknown)".
>>>
>>> Can you fix this also please?
>>
>> The attached patch modifies your patch to also use export_from_secname()
>> for vmlinux and vmlinux.o.
>>
>> This is a rather blind shot at fixing the problem, so please review
>> carefully.  After applying the patch, Module.symvers reports the license
>> correctly for exports from vmlinux.o.

That version of my patch broke modpost for vmlinux.  I don't know if
anyone uses modpost against vmlinux instead of vmlinux.o, but the
attached patch works for both vmlinux and vmlinux.o

> 
> Could you show me how reproduce that problem? Indeed on my system
> "unknown" is reported (erroneously) in the v3.0 series before the
> commit 62a2635610dbc83c5e8d724e00941eee4d18c186 (and obviously after
> my patchset which adds that bug).

I'm not sure what you are asking here.

You mention "my patchset which adds that bug" (which from looking at
the source, appears to me to probably be commit
f02e8a6596b7dc9b2171f7ff5654039ef0950cdc).

The email that I originally replied to is your fix to modpost for modules,
and shows up as commit 62a2635610dbc83c5e8d724e00941eee4d18c186.

My attached fix is meant to extend 62a2635610dbc83c5e8d724e00941eee4d18c186
to also fix modpost for vmlinux.o.

> 
> Thanks!
> 
> Ciao,
> Alessio
> 

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 scripts/mod/modpost.c |    7 	5 +	2 -	0 !
 scripts/mod/modpost.h |    1 	1 +	0 -	0 !
 2 files changed, 6 insertions(+), 2 deletions(-)

Index: b/scripts/mod/modpost.c
===================================================================
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -132,8 +132,10 @@ static struct module *new_module(char *m
 	/* strip trailing .o */
 	s = strrchr(p, '.');
 	if (s != NULL)
-		if (strcmp(s, ".o") == 0)
+		if (strcmp(s, ".o") == 0) {
 			*s = '\0';
+			mod->is_dot_o = 1;
+		}
 
 	/* add to list */
 	mod->name = p;
@@ -589,7 +591,8 @@ static void handle_modversions(struct mo
 	unsigned int crc;
 	enum export export;
 
-	if (!is_vmlinux(mod->name) && strncmp(symname, "__ksymtab", 9) == 0)
+	if ((!is_vmlinux(mod->name) || mod->is_dot_o)
+	    && strncmp(symname, "__ksymtab", 9) == 0)
 		export = export_from_secname(info, get_secindex(info, sym));
 	else
 		export = export_from_sec(info, get_secindex(info, sym));
Index: b/scripts/mod/modpost.h
===================================================================
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -115,6 +115,7 @@ struct module {
 	char **markers;
 	size_t nmarkers;
 	char	     srcversion[25];
+	int is_dot_o;
 };
 
 struct elf_info {

