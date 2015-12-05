Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48765 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754700AbbLEAkY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 19:40:24 -0500
Date: Fri, 4 Dec 2015 16:40:22 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 3/3] UBSAN: run-time undefined behavior sanity
 checker
Message-Id: <20151204164022.ae404aa5a78dd87d979ed60f@linux-foundation.org>
In-Reply-To: <201512042231.PdGxWJsA%fengguang.wu@intel.com>
References: <1449157807-20298-4-git-send-email-aryabinin@virtuozzo.com>
	<201512042231.PdGxWJsA%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, kbuild-all@01.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, 4 Dec 2015 22:27:36 +0800 kbuild test robot <lkp@intel.com> wrote:

> [auto build test WARNING on next-20151203]
> [cannot apply to tip/x86/core kbuild/rc-fixes v4.4-rc3 v4.4-rc2 v4.4-rc1 v4.4-rc3]
> 
> url:    https://github.com/0day-ci/linux/commits/Andrey-Ryabinin/UBSAN-run-time-undefined-behavior-sanity-checker/20151204-202547
> config: i386-allmodconfig (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All warnings (new ones prefixed by >>):
> 
>    lib/ubsan.c: In function 'val_to_string':
> >> lib/ubsan.c:121:8: warning: unused variable 'val' [-Wunused-variable]
>      u_max val = get_unsigned_val(type, value);

I did this.

--- a/lib/ubsan.c~ubsan-run-time-undefined-behavior-sanity-checker-fix
+++ a/lib/ubsan.c
@@ -118,11 +118,11 @@ static u_max get_unsigned_val(struct typ
 static void val_to_string(char *str, size_t size, struct type_descriptor *type,
 	unsigned long value)
 {
-	u_max val = get_unsigned_val(type, value);
-
 	if (type_is_int(type)) {
 		if (type_bit_width(type) == 128) {
 #ifdef CONFIG_ARCH_SUPPORTS_INT128
+			u_max val = get_unsigned_val(type, value);
+
 			scnprintf(str, size, "0x%08x%08x%08x%08x",
 				(u32)(val >> 96),
 				(u32)(val >> 64),

