Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35964 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751949AbcJ1XmU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 19:42:20 -0400
MIME-Version: 1.0
In-Reply-To: <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net> <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
From: Jim Davis <jim.epost@gmail.com>
Date: Fri, 28 Oct 2016 16:42:18 -0700
Message-ID: <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] scripts/basic/fixdep: Complete error handling in print_cmdline()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 28, 2016 at 1:40 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> +       if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {

Rather than scatter fragile magic numbers, like 10, throughout the
code, if you're hell-bent on checking for printf errors you could
write a little wrapper function that hid the magic number and bundled
up the errno stuff.

But what would you expect printf error checking to tell a user?
Perhaps that he or she ran out of disk space, but that's going to be
painfully obvious anyway in almost every case.

-- 
Jim
