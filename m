Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:59853 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750730Ab1GWRuS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 Jul 2011 13:50:18 -0400
Date: Sat, 23 Jul 2011 10:23:35 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] Added hacking menu for override optimization by GCC
Message-Id: <20110723102335.7792b7c1.rdunlap@xenotime.net>
In-Reply-To: <201107231249.46418.mail@smogura.eu>
References: <201107231249.46418.mail@smogura.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?UmFkb3PFgmF3?= Smogura <mail@smogura.eu>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, 23 Jul 2011 12:49:46 +0200 Radosław Smogura wrote:

> This patch gives ability for add some "-fno-..." options for GCC
> and to force -O1 optimization. Supporting files, like Kconfig, Makefile
> are auto-generated due to large amount of available options (not all 
> included).
> 
> Patch helps to debug kernel.
> 
> Signed-off-by: Radosław Smogura <mail@smogura.eu>

Hi,

If possible, please post patches inline instead of as attachments.
It makes patch review much easier.

Comments on (generated) file lib/Kconfig.debug.optim.
Please make corrections to the generating shell script.

+menuconfig HACK_OPTIM
+	bool "Allows to override GCC optimization"

	bool "Allows overriding GCC optimizations"

+	depends on DEBUG_KERNEL && EXPERIMENTAL
+	help
+	  If you say Y here you will be able to override
+	  how GCC optimize kernel code. This will create

	  how GCC optimizes kernel code. This creates

+	  more debug friendly, but with not guarentee

	  more debug-friendly code, but does not guarantee

+	  about same runi, like production, kernel.

	  the same running code like a production kernel.

+
+	  If you say Y here probably You will want say

	                             you will want to say <what>

+	  for all suboptions

	          suboptions.


+config HACK_OPTIM_FORCE_O1_LEVEL
+	bool "Forces -O1 optimization level"
+	---help---
+	  This will change how GCC optimize code. Code

	  This changes how GCC optimizes code.

+	  may be slower and larger but will be more debug
+	  "friendly".
+
+	  In some cases there is low chance that kernel

	  In some cases there is a low chance that the kernel

+	  will run different then normal, reporting or not

	           differently than normal, reporting or not reporting

+	  some bugs or errors. Refere to GCC manual for

	                       Refer to the GCC

+	  more details.
+
+	  You SHOULD say N here.

+config HACK_OPTIM__fno_inline_functions_called_once
+	bool "Adds -fno-inline-functions-called-once parameter to gcc invoke line."
+	---help---

Same comments as above.

and same comments for all suboptions.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
