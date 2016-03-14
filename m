Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35154 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933076AbcCNAkD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Mar 2016 20:40:03 -0400
Received: by mail-ob0-f172.google.com with SMTP id fp4so161287084obb.2
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Mar 2016 17:40:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1457828035-30584-1-git-send-email-yamada.masahiro@socionext.com>
References: <1457828035-30584-1-git-send-email-yamada.masahiro@socionext.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 13 Mar 2016 17:39:42 -0700
Message-ID: <CALCETrVqzidL7SXsCVm8wWrcQMR9dFOLGnDtC-eEYMO4a+yszA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop FORCE from PHONY targets
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Nathan Lynch <nathan_lynch@mentor.com>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>

On Mar 12, 2016 4:14 PM, "Masahiro Yamada"
<yamada.masahiro@socionext.com> wrote:
>
> These targets are marked as PHONY.  No need to add FORCE to their
> dependency.

If this is, in fact, correct, can you update
Documentation/kbuild/makefiles.txt as well?

Thanks,
Andy
