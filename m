Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727793AbgGGQCQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 12:02:16 -0400
Date: Tue, 7 Jul 2020 12:02:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 2/2] kbuild: trace functions in subdirectories of
 lib/
Message-ID: <20200707120212.7010fa4f@oasis.local.home>
In-Reply-To: <20200707092117.963394-2-masahiroy@kernel.org>
References: <20200707092117.963394-1-masahiroy@kernel.org>
        <20200707092117.963394-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Sami Tolvanen <samitolvanen@google.com>, Brendan Higgins <brendanhiggins@google.com>, "David S. Miller" <davem@davemloft.net>, Haren Myneni <haren@us.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jiri Kosina <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Tal Gilboa <talgi@mellanox.com>, kunit-dev@googlegroups.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, live-patching@vger.kernel.org

On Tue,  7 Jul 2020 18:21:17 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

>   ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> 
> exists here in sub-directories of lib/ to keep the behavior of
> commit 2464a609ded0 ("ftrace: do not trace library functions").
> 
> Since that commit, not only the objects in lib/ but also the ones in
> the sub-directories are excluded from ftrace (although the commit
> description did not explicitly mention this).
> 
> However, most of library functions in sub-directories are not so hot.
> Re-add them to ftrace.

I'm OK with this change, but note, it wasn't just the hot path that I
disabled ftrace on lib for, but some of these calls are done very early
at boot up. It may have been PowerPC that I was stumbling over. The
issue is that they would call mcount before the kernel was mapped
properly, and the system would crash.

My PowerPC box no longer boots so I can't test this anymore. But a lot
has changed since 2008, and all this may very well be OK.

-- Steve
