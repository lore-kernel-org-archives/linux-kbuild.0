Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:44387 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757443AbaIIQ2z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Sep 2014 12:28:55 -0400
Received: by mail-vc0-f171.google.com with SMTP id id10so17477237vcb.30
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Sep 2014 09:28:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410260544-22657-2-git-send-email-yamada.m@jp.panasonic.com>
References: <1410260544-22657-1-git-send-email-yamada.m@jp.panasonic.com> <1410260544-22657-2-git-send-email-yamada.m@jp.panasonic.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Tue, 9 Sep 2014 12:28:35 -0400
Message-ID: <CAOFdcFM78JKo9Q+VwviBuFjfPWim63cqu2jgDhLT=KhWx4We4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: fake the "Entering directory ..." message
 more simply
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 9, 2014 at 7:02 AM, Masahiro Yamada
<yamada.m@jp.panasonic.com> wrote:
> Commit c2e28dc975ea87feed84415006ae143424912ac7
> (kbuild: Print the name of the build directory)
> added a gimmick to show the "Entering directory ...".
>
> Instead of echoing the hard-coded message (that is, we need to know
> the exact message), moving --no-print-directory would be easier.
>
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Acked-by: Peter Foley <pefoley2@pefoley.com>
