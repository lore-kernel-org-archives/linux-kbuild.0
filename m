Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42848 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033AbbLHX7Q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2015 18:59:16 -0500
Date: Tue, 8 Dec 2015 15:59:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 3/3] UBSAN: run-time undefined behavior sanity
 checker
Message-Id: <20151208155914.d0b005c82906f3203660fd47@linux-foundation.org>
In-Reply-To: <1449157807-20298-4-git-send-email-aryabinin@virtuozzo.com>
References: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
	<1449157807-20298-4-git-send-email-aryabinin@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, 3 Dec 2015 18:50:07 +0300 Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:

> UBSAN uses compile-time instrumentation to catch undefined behavior (UB).
> Compiler inserts code that perform certain kinds of checks before
> operations that could cause UB. If check fails (i.e. UB detected)
> __ubsan_handle_* function called to print error message.
> 
> So the most of the work is done by compiler. This patch just
> implements ubsan handlers printing errors.
> 
> GCC has this capability since 4.9.x [1] (see -fsanitize=undefined
> option and its suboptions).
> However GCC 5.x has more checkers implemented [2].
> Article [3] has a bit more details about UBSAN in the GCC.
> 
> ...
>
> +#ifdef CONFIG_ARCH_SUPPORTS_INT128
> +typedef __int128 s_max;
> +typedef unsigned __int128 u_max;
> +#else

In file included from lib/ubsan.c:21:
lib/ubsan.h:77: error: expected '=', ',', ';', 'asm' or '__attribute__' before 's_max'
lib/ubsan.h:78: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'u_max'
lib/ubsan.c:89: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'get_signed_val'


gcc-4.4.4 doesn't appear to like __int128.  The only other use of
__int128 is include/linux/math64.h:mul_u64_u32_shr() and it uses
defined(__SIZEOF_INT128__) as well.

Using that gives me

lib/ubsan.c: In function 'val_to_string':
lib/ubsan.c:127: warning: right shift count >= width of type
lib/ubsan.c:128: warning: right shift count >= width of type

so I bodged that site too.  I need to get an mmotm release out the door.


--- a/lib/ubsan.c~ubsan-run-time-undefined-behavior-sanity-checker-fix-3
+++ a/lib/ubsan.c
@@ -120,7 +120,7 @@ static void val_to_string(char *str, siz
 {
 	if (type_is_int(type)) {
 		if (type_bit_width(type) == 128) {
-#ifdef CONFIG_ARCH_SUPPORTS_INT128
+#if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
 			u_max val = get_unsigned_val(type, value);
 
 			scnprintf(str, size, "0x%08x%08x%08x%08x",
--- a/lib/ubsan.h~ubsan-run-time-undefined-behavior-sanity-checker-fix-3
+++ a/lib/ubsan.h
@@ -73,7 +73,7 @@ struct invalid_value_data {
 	struct type_descriptor *type;
 };
 
-#ifdef CONFIG_ARCH_SUPPORTS_INT128
+#if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
 typedef __int128 s_max;
 typedef unsigned __int128 u_max;
 #else
_

