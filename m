Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:49233 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756600AbcKBRsO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 13:48:14 -0400
Subject: Re: scripts/basic/bin2c: Complete error handling in main()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
 <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
Date: Wed, 2 Nov 2016 18:48:03 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Is replacing printf("\"\n") with puts("\"") optimization?

Is the difference relevant if an “ordinary” string is passed instead of
a format string?


> Frankly, the result of this patch seems extremely unreadable code.

Do you care for more complete error detection and corresponding exception handling
in this source file?

Regards,
Markus
