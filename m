Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36491 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751752AbcJ1Wce (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 18:32:34 -0400
MIME-Version: 1.0
In-Reply-To: <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net> <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
From: Jim Davis <jim.epost@gmail.com>
Date: Fri, 28 Oct 2016 15:32:32 -0700
Message-ID: <CA+r1ZhjvZmDjuoroL-N6s1SU6+CQwBM0izjvP9kigGO7ThW5kQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] scripts/basic/bin2c: Complete error handling in main()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 28, 2016 at 1:31 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 27 Oct 2016 16:15:04 +0200
>
> Return values were not checked from five calls of the function "printf".
>
> This issue was detected also by using the Coccinelle software.
>
>
> * Add a bit of exception handling there.
>
> * Optimise this function implementation a bit.

The most interesting thing about this patch was trying to figure out
how to actually get bin2c to run at all.  Making a defconfig kernel
didn't run it.  Making a kernel with the latest Ubuntu 16.10 config
file didn't run it.  Setting CONFIG_IKCONFIG runs it (once), for the
folks who want to use scripts/extract-ikconfig.  After that, if you
dig about in the makefiles, it looks like you have to turn on the
Tomoyo LSM -- which doesn't seem to be a common occurrence -- or else
set CONFIG_KEXEC_FILE to generate the 'purgatory' thing it uses.
Again, not the most frequent of events, as far as I can tell.

Given how uncommon running bin2c seems to be, "optimizing" it may not
be a useful project.

-- 
Jim
