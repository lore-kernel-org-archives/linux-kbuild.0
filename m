Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:34186 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475AbcBXPTr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Feb 2016 10:19:47 -0500
Received: by mail-qk0-f173.google.com with SMTP id x1so7791725qkc.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Feb 2016 07:19:46 -0800 (PST)
Date: Wed, 24 Feb 2016 10:19:44 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v3 0/7] Trim unused exported kernel symbols
In-Reply-To: <1455826023-2134-1-git-send-email-nicolas.pitre@linaro.org>
Message-ID: <alpine.LFD.2.20.1602241017490.13632@knanqh.ubzr>
References: <1455826023-2134-1-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org


Gentle ping.


On Thu, 18 Feb 2016, Nicolas Pitre wrote:

> This patch series provides the option to omit exported symbols from
> the kernel and modules that are never referenced by any of the selected
> modules in the current kernel configuration.
> 
> The original cover letter with lots of test results can be found here:
> 
>         https://lkml.org/lkml/2016/2/8/813
> 
> A git branch with those patches is also available here:
> 
>         http://git.linaro.org/people/nicolas.pitre/linux.git autoksyms
> 
> Please consider for merging.
> 
> Changes from v2:
> 
> - Generating the build dependencies by parsing the source with fixdep
>   turned out to be unreliable due to all the EXPORT_SYMBOL() variants,
>   and especially their use within macros where the actual symbol name
>   is known only after running the preprocessor. This list of symbol names
>   is now obtained from the preprocessor directly, fixing allmodconfig
>   builds.
> 
> Changes from v1:
> 
> - Replaced "exp" that doesn't convey the right meaning as noted by
>   Sam Ravnborg. The "ksym" identifier is actually what the kernel
>   already uses for this. Therefore:
>   - CONFIG_TRIM_UNUSED_EXPSYMS --> CONFIG_TRIM_UNUSED_KSYMS
>   - include/generated/expsyms.h --> include/generated/autoksyms.h
>   - #define __EXPSYM_* --> #define __KSYM_*
> 
> - Some sed regexp improvements as suggested by Al Viro.
> 
> - Renamed vmlinux_recursive target to autoksyms_recursive.
> 
> - Accept EXPORT_SYMBOL variants with a prefix, e.g. ACPI_EXPORT_SYMBOL.
> 
> - Minor commit log clarifications.
> 
> - Added Rusty's ACK.
> 
> 
