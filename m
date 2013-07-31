Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:50035 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338Ab3GaOrt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Jul 2013 10:47:49 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: kconfig/menu.c: Fixup to "kconfig: fix undesirable side effect of adding "visible" menu attribute" ?
In-Reply-To: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
	(Sedat Dilek's message of "Tue, 30 Jul 2013 19:11:36 +0200")
References: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
Date: Wed, 31 Jul 2013 16:16:14 +0200
Message-ID: <gir4eeizm9.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Jan Beulich <JBeulich@novell.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Sedat Dilek <sedat.dilek@gmail.com> writes:

> Hi,
>
> The Freetz router project has 370 [1] as a revert-patch of [2] to its
> kconfig-v3.8.
>
> commit 7ad1227818f09242cfe9bf1845fd24211f5f99bd
> "kconfig: fix undesirable side effect of adding "visible" menu attribute"
>
> I am not a kconfig-expert, but [3] looks like a fixup/folowup to it.
>
> commit/?id=e983b7b17ad1a978e954e6aaa62cf12bfc747883
> "kconfig/menu.c: fix multiple references to expressions in menu_add_prop()"
>
> I contacted Yann in private, but I think this is worth to ask on the
> linux-kbuild ML.

Hi Sedat,

you are right, [3] fixes a problem that was introduced by [2].
(I should have noted that in the commit message -- I'm not sure if we
can fix that afterwards.)

Best regards,

Dirk

> Thanks in advance for your help.

> Regards,
> - Sedat -
>
> [1] http://freetz.org/browser/trunk/tools/make/patches/370-save-hidden-prompts-to-file.kconfig.patch
> [2] kconfig: fix undesirable side effect of adding "visible" menu attribute
> [3] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
