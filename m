Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751077AbdLAAWg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 19:22:36 -0500
Date: Thu, 30 Nov 2017 19:22:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 11/21] trace: Use -mcount-record for dynamic ftrace
Message-ID: <20171130192233.181dad47@gandalf.local.home>
In-Reply-To: <20171127213423.27218-12-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
        <20171127213423.27218-12-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

On Mon, 27 Nov 2017 13:34:13 -0800
Andi Kleen <andi@firstfloor.org> wrote:

> From: Andi Kleen <ak@linux.intel.com>
> 
> gcc 5 supports a new -mcount-record option to generate ftrace
> tables directly. This avoids the need to run record_mcount
> manually.
> 
> Use this option when available.
> 
> So far doesn't use -mcount-nop, which also exists now.
> 
> This is needed to make ftrace work with LTO because the
> normal record-mcount script doesn't run over the link
> time output.
> 
> It should also improve build times slightly in the general
> case.
> 
> Cc: rostedt@goodmis.org
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---

Hi Andi,

Thanks for sending this. I'm currently trying to catch up on all the
changes that need to get into 4.15 and will be doing a bit of
traveling.

I plan on looking at this in a week or two, and add it to the 4.16
queue.

-- Steve
