Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38378 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932112AbcEYRMV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2016 13:12:21 -0400
Received: by mail-wm0-f48.google.com with SMTP id n129so71071861wmn.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 May 2016 10:12:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57458279.6080009@suse.com>
References: <20160524000719.b456ed0cd2aafacb4e53f177@gmail.com>
 <CAGXu5jKC=HuCe3FPuuzjAZ+SX6C5AnhMp5BWwLhi8xVXhTGjEg@mail.gmail.com> <57458279.6080009@suse.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 25 May 2016 10:12:17 -0700
Message-ID: <CAGXu5jKw_oQNCVUH+o_k-W+5Z7LDXgJ3UpP24a+y4S0Ny+gvvw@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] Introduce GCC plugin infrastructure
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Emese Revfy <re.emese@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>, Dmitry Vyukov <dvyukov@google.com>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Wed, May 25, 2016 at 3:46 AM, Michal Marek <mmarek@suse.com> wrote:
> On 2016-05-24 19:04, Kees Cook wrote:
>> On Mon, May 23, 2016 at 3:07 PM, Emese Revfy <re.emese@gmail.com> wrote:
>>> This patch set introduce the GCC plugin infrastructure with examples for testing
>>> and documentation.
>>>
>>> GCC plugins are loadable modules that provide extra features to the compiler.
>>> They are useful for runtime instrumentation and static analysis.
>>>
>>> The infrastructure supports all gcc versions from 4.5 to 6.0, building
>>> out-of-tree modules and building in a separate directory. Cross-compilation
>>> is supported too but currently only the x86, arm, arm64 and uml architectures enable plugins.
>>>
>>> This infrastructure was ported from grsecurity/PaX. Based on work created by the PaX Team.
>>> It is a CII project supported by the Linux Foundation.
>>>
>>> Emese Revfy (4):
>>>  Shared library support
>>>  GCC plugin infrastructure
>>>  Add Cyclomatic complexity plugin
>>>  Add sancov plugin
>>
>> Michal, once -rc1 is out, can you carry this for -next?
>
> Yes.

Awesome! Please consider it:

Acked-by: Kees Cook <keescook@chromium.org>

If it's any help, I have it in my tree here:

http://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/log/?h=kspp/gcc-plugins/infrastructure

Thanks!

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
