Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0082.hostedemail.com ([216.40.44.82]:56903 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933652AbdCUSMo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Mar 2017 14:12:44 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 7B99BB171E
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Mar 2017 18:04:58 +0000 (UTC)
Date: Tue, 21 Mar 2017 14:04:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PING PATCH v2] jump label: fix passing kbuild_cflags when
 checking for asm goto support
Message-ID: <20170321140444.2e7f9d34@vmware.local.home>
In-Reply-To: <CAK7LNATDkCkC=XqA8xkECNhKf_Jh+4aWLgaNZGopBdrVAxHPhg@mail.gmail.com>
References: <20170310162411.GA18175@glebfm.cloud.tilaa.com>
        <20170310120422.14e19269@gandalf.local.home>
        <20170310173952.GW27556@glebfm.cloud.tilaa.com>
        <20170310124210.5f52305f@gandalf.local.home>
        <20170310175536.GX27556@glebfm.cloud.tilaa.com>
        <20170320171553.GB23333@glebfm.cloud.tilaa.com>
        <CAK7LNATDkCkC=XqA8xkECNhKf_Jh+4aWLgaNZGopBdrVAxHPhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, David Lin <dtwlin@google.com>, "Anton V. Boyarshinov" <boyarsh@altlinux.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Wed, 22 Mar 2017 02:48:44 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 
> I assume this PING is addressed to me.
> 
> First, Steven asked Andrew to pick up this,
> but I have not seen it in linux-next yet. So,
> 
> Applied to linux-kbuild/fixes.  Thanks!

Thanks Masahiro!

-- Steve
