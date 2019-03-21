Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:52108 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfCUVF1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Mar 2019 17:05:27 -0400
Date: Thu, 21 Mar 2019 14:05:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4] lib/string.c: implement a basic bcmp
Message-Id: <20190321140524.2888cc3c3e0726c4fdfc1b21@linux-foundation.org>
In-Reply-To: <CAKwvOdn84HNEB3u4XO-V_+c=txmDd1061G_7K0zZVS4MfF--Lg@mail.gmail.com>
References: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
        <20190313211335.165605-1-ndesaulniers@google.com>
        <20190320191135.e49e976a8258c8ac0bb428c9@linux-foundation.org>
        <CAKwvOdn84HNEB3u4XO-V_+c=txmDd1061G_7K0zZVS4MfF--Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Thu, 21 Mar 2019 10:02:37 -0700 Nick Desaulniers <ndesaulniers@google.com> wrote:

> Shall I send you a cleanup removing the undefs for bcmp, memcmp,
> strcat, strcpy, and strcmp?  Of those, I only see memcmp being
> `#defined` in arch/m68k/include/asm/string.h, arch/x86/boot/string.h,
> and arch/x86/include/asm/string_32.h.
> 
> Further, I can drop some of the __GNUC__ < 4 code in
> arch/x86/include/asm/string_32.h. (grepping for __GNUC__, looks like
> there's a fair amount of code that can be cleaned up).  We should
> probably check it since Clang lies about being GCC 4.2 compatible,
> which will surely break in horrific ways at some point.\

All sounds good.  Some time, when convenient, thanks.
