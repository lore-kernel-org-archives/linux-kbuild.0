Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:46240 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751428AbcJ1IJ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:09:26 -0400
Date: Fri, 28 Oct 2016 10:09:21 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-ID: <20161028080921.e3ayne5w52zc2p2l@linutronix.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
 <CAKocOONAiGTfPXDSLC3gb6gvj7-DCbeYbUR1atBJmCQ7Cq-sAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKocOONAiGTfPXDSLC3gb6gvj7-DCbeYbUR1atBJmCQ7Cq-sAw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkhan@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>

On 2016-10-27 11:09:06 [-0600], Shuah Khan wrote:
> diff --git a/Makefile b/Makefile
> index 82a36ab..0a01ad1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -651,6 +651,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
>  KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
>  endif
> 
> +# force no-pie for distro compilers that enable pie by default
> +KBUILD_CFLAGS += $(call cc-option, -fno-pie)
> +KBUILD_CFLAGS += $(call cc-option, -no-pie)

so why do we need -no-pie? What is different from -fno-pie

> +KBUILD_AFLAGS += $(call cc-option, -fno-pie)

Why do need to pass this to the assembler? Is this for the
fstack-protector?

> 
> thanks,
> -- Shuah

Sebastian
