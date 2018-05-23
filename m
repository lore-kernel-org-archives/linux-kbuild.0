Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752162AbeEWAdW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 20:33:22 -0400
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC65420882
        for <linux-kbuild@vger.kernel.org>; Wed, 23 May 2018 00:33:21 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l1-v6so4427321wmb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 May 2018 17:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180523001939.9431-1-labbott@redhat.com> <20180523001939.9431-3-labbott@redhat.com>
In-Reply-To: <20180523001939.9431-3-labbott@redhat.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 22 May 2018 17:33:09 -0700
Message-ID: <CALCETrX9P2Lwrx7wGc22poVWX2AHAqXbUdhcijyoJ3tGhaxijg@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] x86/vdso: Add build salt to the vDSO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andrew Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H. J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

On Tue, May 22, 2018 at 5:19 PM Laura Abbott <labbott@redhat.com> wrote:


> The vDSO is linked separately from the kernel and modules. Ensure it picks
> up the comment section, if available.

Did you end up preferring this to just sticking the kernel version in a
.comment in the vDSO for some reason?
