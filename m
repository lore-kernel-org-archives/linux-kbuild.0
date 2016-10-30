Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:63330 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751301AbcJ3PSR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Oct 2016 11:18:17 -0400
Subject: Re: scripts/basic/fixdep: Complete error handling in print_cmdline()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
 <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <5e73f504-fae2-c1c9-0dea-c2860cc4a683@users.sourceforge.net>
Date: Sun, 30 Oct 2016 16:17:22 +0100
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> But what would you expect printf error checking to tell a user?

I wonder that the error detection and corresponding exception handling
was not corrected for the affected source files of build-time tools so far.
https://www.securecoding.cert.org/confluence/display/c/EXP12-C.+Do+not+ignore+values+returned+by+functions

Regards,
Markus
