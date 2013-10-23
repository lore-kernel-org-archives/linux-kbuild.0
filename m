Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:39069 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736Ab3JWOLq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Oct 2013 10:11:46 -0400
Received: by mail-ob0-f176.google.com with SMTP id uy5so819065obc.35
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2013 07:11:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1379421817-15759-1-git-send-email-Russ.Dill@ti.com>
References: <1379421817-15759-1-git-send-email-Russ.Dill@ti.com>
Date: Wed, 23 Oct 2013 16:11:46 +0200
Message-ID: <CACRpkdZpAqmnS5=F9va6xWECmG85TO_Lv7Gicx5qx=m6bNgohw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] Embeddable Position Independent Executable
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russ Dill <Russ.Dill@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-OMAP <linux-omap@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, mans@mansr.com, Shawn Guo <shawn.guo@linaro.org>, Dave Martin <Dave.Martin@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

On Tue, Sep 17, 2013 at 2:43 PM, Russ Dill <Russ.Dill@ti.com> wrote:

> This patch adds support for and demonstrates the usage of an embedded
> position independent executable (PIE). The goal is to allow the use of C
> code in situations where carefully written position independent assembly
> was previously required.

This is perfectly applicable to the ARM TCM memory as well.

Currently we have arch/arm/kernel/tcm.c and related extensions to
kernel/vmlinux.kds.S, which enables us to tag some certain code
to be compiled into TCM memory which we map statically to
0xfffe0000 thru 0xfffeffff, but this is a better approach, especially
nice since it is the solution to the multiplatform situation, as we
need to select to copy code into that memory only on the specific
target.

I'll try to have a deeper look at this, please keep me on CC for
this series.

Yours,
Linus Walleij
