Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:35728 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801AbbFZLRH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Jun 2015 07:17:07 -0400
Received: by wiga1 with SMTP id a1so14679673wig.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2015 04:17:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434631909-12636-1-git-send-email-riku.voipio@linaro.org>
References: <1434631909-12636-1-git-send-email-riku.voipio@linaro.org>
Date: Fri, 26 Jun 2015 14:17:06 +0300
Message-ID: <CAAqcGHn2cNaVNL594ta3xRZqJ8EU-AfC=rEQYHOmp7_RxtpdaA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.perf: make python module depend on traceevent
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: acme@kernel.org, hekuang@huawei.com, wangnan0@huawei.com

On 18 June 2015 at 15:51,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Building python module might fail if libtraceevent-dynamic-list
> hasn't been built before:
>
> to LDFLAGS:
>
>   GEN      python/perf.so
> /usr/bin/ld: cannot open linker script file /x/tools/lib/traceevent/libtraceevent-dynamic-list: No such file or directory
> collect2: error: ld returned 1 exit status
> error: command 'x86_64-linux-gnu-gcc' failed with exit status 1
> cp: cannot stat ?python_ext_build/lib/perf.so?: No such file or directory
>
> Add explicit Makefile dependency to make sure libtraceevent-dynamic-list
> is built before.

Forget this broken patch, the correct patch has already been applied:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/tools/perf/Makefile.perf?id=5d618324dd4442d20dbdb039176787199ba2f12b

perf tools: Move libtraceevent dynamic list to separated LDFLAGS variable

Riku

> ---
>  tools/perf/Makefile.perf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index b1dfcd8..66045d0 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -188,7 +188,7 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
>  python-clean := $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT)python/perf.so
>
>  PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
> -PYTHON_EXT_DEPS := util/python-ext-sources util/setup.py $(LIBTRACEEVENT) $(LIBAPI)
> +PYTHON_EXT_DEPS := util/python-ext-sources util/setup.py $(LIBTRACEEVENT) $(LIBTRACEEVENT_DYNAMIC_LIST) $(LIBAPI)
>
>  $(OUTPUT)python/perf.so: $(PYTHON_EXT_SRCS) $(PYTHON_EXT_DEPS)
>         $(QUIET_GEN)CFLAGS='$(CFLAGS)' $(PYTHON_WORD) util/setup.py \
> --
> 2.1.4
>
