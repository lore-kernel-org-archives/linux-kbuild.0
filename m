Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:42178 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbeBRRKI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 12:10:08 -0500
Date: Sun, 18 Feb 2018 18:10:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] kbuild: rename built-in.o to built-in.a
Message-ID: <20180218171005.GA20286@ravnborg.org>
References: <20180210142504.29890-1-npiggin@gmail.com>
 <20180210142504.29890-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180210142504.29890-3-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Hi Nicholas.

On Sun, Feb 11, 2018 at 12:25:04AM +1000, Nicholas Piggin wrote:
> Incremental linking is gone, so rename built-in.o to built-in.a, which
> is the usual extension for archive files.
> 
> This patch does two things, first is a simple search/replace:
> 
> git grep -l 'built-in\.o' | xargs sed -i 's/built-in\.o/built-in\.a/g'
> 
> The second is to invert nesting of nested text manipulations to avoid
> filtering built-in.a out from libs-y2:
> 
> -libs-y2 := $(filter-out %.a, $(patsubst %/, %/built-in.a, $(libs-y)))
> +libs-y2 := $(patsubst %/, %/built-in.a, $(filter-out %.a, $(libs-y)))
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Renaming is welcome - .o files should not list files.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Did you check that make clean / make mrproper continue to
do the right thing?

I recalled we had "*.o" hardcoded somewhere but grep
did not reveal any places that should matter.
So likely it does.

	Sam
