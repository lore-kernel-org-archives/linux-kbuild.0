Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39446 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFFUyL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jun 2019 16:54:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id g9so1394113plm.6
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2019 13:54:11 -0700 (PDT)
Date: Thu, 6 Jun 2019 13:54:06 -0700
From: Tom Roeder <tmroeder@google.com>
Subject: Re: [RFC PATCH] kbuild: Add option to generate a Compilation Database
Message-ID: <20190606205406.GA120512@google.com>
References: <20190606203003.112040-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606203003.112040-1-rrangel@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Raul E Rangel <rrangel@chromium.org>
Cc: yamada.masahiro@socionext.com, mka@chromium.org, ndesaulniers@google.com, zwisler@chromium.org, Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Changbin Du <changbin.du@intel.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Sri Krishna chowdary <schowdary@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Mikulas Patocka <mpatocka@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Jun 06, 2019 at 02:30:03PM -0600, Raul E Rangel wrote:
> Clang tooling requires a compilation database to figure out the build
> options for each file. This enables tools like clang-tidy and
> clang-check.
> 
> See https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html for more
> information.

I'm glad to see someone adding this to the Makefile directly. I added
scripts/gen_compile_commands.py in b302046 (in Dec 2018) when I was
working on using clang-check to look for bugs in KVM. That script
sidesteps the -MJ option because I found that trying to add it as an
extra option ended up adding entries to the database that didn't work
properly in some cases. This patch adds -MJ in a different way than I
was trying, so I hope it doesn't have the same problems.

I would much prefer to have this functionality integrated into the
Makefile system directly, so if this works with clang-check over all
files and doesn't lead to spurious entries in the database, I'm all for
it.

> 
> Normally cmake is used to generate the compilation database, but the
> linux kernel uses make. Another option is using
> [BEAR](https://github.com/rizsotto/Bear) which instruments
> exec to find clang invocations and generate the database that way.
> 
> Clang 4.0.0 added the -MJ option to generate the json for each
> compilation unit. https://reviews.llvm.org/D27140
> 
> This patch takes advantage of the -MJ option. So it only works for
> Clang.
> 
Can you please add details about how this was tested and compare
coverage with the existing script?

Tom
