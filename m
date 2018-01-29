Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54820 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751562AbeA2Qfk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jan 2018 11:35:40 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 29 Jan 2018 08:35:38 -0800
From: Sodagudi Prasad <psodagud@codeaurora.org>
Subject: Re: [PATCH] kbuild: clang: Disable -Wunused-const-variable warnings
In-Reply-To: <20180128162239.GZ21977@gate.crashing.org>
References: <CAK7LNAQAtPQOXPKyhrs4w7cLXoO5vpM9_Yi_=_G0gNYmNNv_FA@mail.gmail.com>
 <1517014786-30685-1-git-send-email-psodagud@codeaurora.org>
 <20180128162239.GZ21977@gate.crashing.org>
Message-ID: <fd6fdda6c0080e72598eabd2c88d7df6@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: gregkh@linuxfoundation.org, mmarek@suse.com, ghackmann@google.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2018-01-28 08:22, Segher Boessenkool wrote:
> On Fri, Jan 26, 2018 at 04:59:46PM -0800, Prasad Sodagudi wrote:
>> Disable -Wunused-const-variable warnings instead of
>> disabling -Wunused-variable warnings, So that in both
>> clang and GCC -Wunused-const-variable gets disabled.
> 
> Why would you disable -Wunused-const-variable on GCC?  You do not
> explain why.

Hi Segher,

Please check below discussion with Greg and Masahiro about 
"unused-variable".
https://lkml.org/lkml/2017/12/18/697


Please check this link, "unused-const-variable" warning is already 
disabled for GCC.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?h=v4.15#n719
Below commit is disabling the "unused-const-variable" for GCC.
commit -  c9c6837d39311b0c - "kbuild: move -Wunused-const-variable to 
W=1 warning level"

Currently "unused-variable" warnings are disabled for clang and not for 
the gcc.  Disabling of
"unused-variable" warning also disables "unused-const-variable" warning. 
To match same settings
between clang and gcc, disabling "unused-const-variable" warnings for 
clang as well.
So with this patch, keeping the same settings for GCC and CLANG with 
respect to "unused-const-variable".

-Thanks, Prasad

> 
> 
> Segher

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
Linux Foundation Collaborative Project
