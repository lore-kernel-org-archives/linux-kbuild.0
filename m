Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34246 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752524AbcLICPu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 21:15:50 -0500
Received: by mail-pf0-f193.google.com with SMTP id y68so249056pfb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Dec 2016 18:15:33 -0800 (PST)
Date: Fri, 9 Dec 2016 12:15:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: dead code elimination: ftrace fixes
Message-ID: <20161209121519.797afbb3@roar.ozlabs.ibm.com>
In-Reply-To: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Michal Marek <mmarek@suse.com>, Paul Burton <paul.burton@imgtec.com>, linux-kbuild@vger.kernel.org

On Thu, 8 Dec 2016 12:55:05 +0100
Marcin Nowakowski <marcin.nowakowski@imgtec.com> wrote:

> Enabling dead code & data elimination currently breaks ftrace operation,
> as the __mcount_loc section is removed (as it is not referenced directly
> anywhere in the code).
> Moreover, there are a lot of entries missing in the __mcount_loc section
> as the recordmcount tool doesn't currently properly handle the section
> names as created by the use of -ffunction-sections.
> 
> The following 2 patches fix that behaviour.
> They are based on next-20161208.
> 
> Marcin Nowakowski (2):
>   kbuild: keep __mcount_loc table through dead code elimination
>   recordmcount: fix mcount recording with -ffunction-sections

These both look okay to me, thanks.

Acked-by: Nicholas Piggin <npiggin@gmail.com>
