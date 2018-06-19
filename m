Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-sn1nam01on0086.outbound.protection.outlook.com ([104.47.32.86]:44400
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755546AbeFSHMY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jun 2018 03:12:24 -0400
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v4 1/9] Makefile: Prepare for using macros for inline asm
Date: Tue, 19 Jun 2018 07:12:20 +0000
Message-ID: <062A4564-15F4-41B2-8808-475F3F4CB119@vmware.com>
References: <20180612115050.185112-1-namit@vmware.com>
 <20180612115050.185112-2-namit@vmware.com>
 <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com>
 <D9AF0864-EE2A-4C2E-A5A4-C002DEB95B2B@vmware.com>
 <CAK7LNASdmie+Y4haU5bCMb8s4RztHzOcFXUxGxjcCqsbwPN7uw@mail.gmail.com>
In-Reply-To: <CAK7LNASdmie+Y4haU5bCMb8s4RztHzOcFXUxGxjcCqsbwPN7uw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <66A520A173241D45A4B814AEC190EE83@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

at 5:40 PM, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> In the meanwhile, CFLAGS_REMOVE_ will do
> as a workaround.

Thanks! I appreciate your help.

I will submit tomorrow an updated version.

Regards,
Nadav
