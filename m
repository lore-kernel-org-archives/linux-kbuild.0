Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42]:34116 "EHLO
        mail-vk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751993AbcLASNv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Dec 2016 13:13:51 -0500
Received: by mail-vk0-f42.google.com with SMTP id x186so133020214vkd.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Dec 2016 10:13:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b4a882d3-6125-e7b7-6c60-901fabfc23d9@suse.com>
References: <20161126182006.24815-1-pefoley2@pefoley.com> <20161128064446.4892-1-pefoley2@pefoley.com>
 <b4a882d3-6125-e7b7-6c60-901fabfc23d9@suse.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Thu, 1 Dec 2016 10:13:30 -0800
Message-ID: <CAOFdcFMTQbkE4ODTmrxq2dkzkNV8PXcMD0V3UhXyL62xvhgTGA@mail.gmail.com>
Subject: Re: [PATCH v4] Fixes for compiling with clang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, Nov 29, 2016 at 6:22 AM, Michal Marek <mmarek@suse.com> wrote:
> Dne 28.11.2016 v 07:44 Peter Foley napsal(a):
> This adds new -Wno-* options also for the gcc case, is there a reason
> for this? Also, the -Wno-missing-field-initializers option is not
> available in some old gccs, so we would need a HOSTCC equivalent of
> cc-disable-warning.
>
> Michal

It appeared that the conditional was simply reversed, as
-fno-delete-null-pointer-checks is only supported by gcc, and
explicitly not supported by clang.
(see https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/Makefile?id=61163efae02040f66a95c8ed17f4407951ba58fa)
It could be that the fno-delete-null-pointer-checks option was simply
misplaced, and the Wno-options should still be guarded by if(clang),
would that be a better approach?

Thanks,

Peter
