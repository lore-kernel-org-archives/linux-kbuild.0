Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:33213 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753194AbcAGWBa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2016 17:01:30 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: kbuild: global makefile and spaces in path
References: <87lh8nfrx8.fsf@belgarion.home> <568D2927.2010106@suse.com>
Date: Thu, 07 Jan 2016 22:53:54 +0100
In-Reply-To: <568D2927.2010106@suse.com> (Michal Marek's message of "Wed, 6
	Jan 2016 15:48:07 +0100")
Message-ID: <87mvshdpjh.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Michal Marek <mmarek@suse.com> writes:

> On 2015-12-21 21:49, Robert Jarzmik wrote:
>> Hi Michal,
>> 
>> I compiled my kernel in a directory /home/robert jarzmik/kernel, and that's the
>> first time I encountered a space in the path containing my kernel in years.
>> 
>> I was wondering if there is a known constraint that the linux kernel source
>> should be contained within a path without any space ?
> Whitespace and colons are problematic.
Ok.

>> If no such constraint is known, maybe you could consider the patch in [1].
> I expect it is going to break in lot more places, especially if you do
> an O= build. I think it's better to just check for this and error out early.
Ok, I'll try to do that. Let's see if the patch at the end of this mail is what
you're expecting.

Cheers.

-- 
Robert

---8<---
From 68bcedba135cc50254a234a949ed5cd3b4e92b7a Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 7 Jan 2016 22:39:51 +0100
Subject: [PATCH] kbuild: forbid kernel directory to contain spaces

When the kernel path contains a space somewhere in the path name, the
modules_install target doesn't work anymore, as the path names are not
enclosed in double quotes. It is also supposed that and O= build will
suffer from the same weakness as modules_install.

Instead of checking and improving kbuild to resist to directories
including spaces, error out early to prevent any build if the kernel's
main directory contains a space.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 45ec34644b4f..72e9b7371b0d 100644
--- a/Makefile
+++ b/Makefile
@@ -128,6 +128,10 @@ _all:
 # Cancel implicit rules on top Makefile
 $(CURDIR)/Makefile Makefile: ;
 
+ifneq ($(words $(CURDIR)),1)
+  $(error main directory cannot contain spaces)
+endif
+
 ifneq ($(KBUILD_OUTPUT),)
 # Invoke a second make in the output directory, passing relevant variables
 # check that the output directory actually exists
-- 
2.1.4

