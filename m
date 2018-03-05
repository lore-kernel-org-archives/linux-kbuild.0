Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:40602 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751354AbeCEPVk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Mar 2018 10:21:40 -0500
Received: by mail-wm0-f45.google.com with SMTP id t6so16305479wmt.5
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Mar 2018 07:21:39 -0800 (PST)
Date: Mon, 5 Mar 2018 16:21:25 +0100
From: Robin Jarry <robin.jarry@6wind.com>
Subject: Re: [PATCH] objtool: make use of pkg-config for libelf
Message-ID: <20180305152125.7fjlbermrfvg4wzi@6wind.com>
References: <20180301125537.14160-1-pp@emlix.com>
 <20180305145339.444neh5ablzofg42@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180305145339.444neh5ablzofg42@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Philipp Puschmann <pp@emlix.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, peterz@infradead.org, linux-kbuild@vger.kernel.org

2018-03-05, Josh Poimboeuf:
> [ Adding Robin ]
> 
> Robin, does this fix the same issue as your recent patches?  If so, I'd
> prefer this one because it doesn't need any new environment variables.

Hi Josh,

this looks like it would work. I need to do proper testing before
confirmation. Also, I did not have time to work on a v3. I'll wait a bit
to see where this goes first.

-- 
Robin
