Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:41817 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfKRO02 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 09:26:28 -0500
Received: by mail-io1-f67.google.com with SMTP id r144so18902474iod.8
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2019 06:26:28 -0800 (PST)
Subject: Re: [PATCH] kbuild: make single target builds even faster
References: <20191118045247.14082-1-yamada.masahiro@socionext.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2b1ab1b1-dd20-31f7-c787-921cbd66a828@kernel.dk>
Date: Mon, 18 Nov 2019 07:26:24 -0700
MIME-Version: 1.0
In-Reply-To: <20191118045247.14082-1-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On 11/17/19 9:52 PM, Masahiro Yamada wrote:
> Commit 2dffd23f81a3 ("kbuild: make single target builds much faster")
> made the situation much better.
> 
> To improve it even more, apply the similar idea to the top Makefile.
> Trim unrelated directories from build-dirs.
> 
> The single build code must be moved above the 'descend' target.

I tested linux-next, which does improve things a bit, and this one on
top further improves it. We're now not THAT far off the situation
before these changes, that's a huge win. Thanks for working on this!

You can add:

Tested-by: Jens Axboe <axboe@kernel.dk>

to the commit, if you wish.

-- 
Jens Axboe
