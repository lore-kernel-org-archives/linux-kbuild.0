Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:42100 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab3G3RLh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Jul 2013 13:11:37 -0400
Received: by mail-we0-f170.google.com with SMTP id w60so5445230wes.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2013 10:11:36 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
Date: Tue, 30 Jul 2013 19:11:36 +0200
Message-ID: <CA+icZUVn+a=LSvO9JZXng1E0Ee+4ETk01PPCMRtfV9jqXRXAjw@mail.gmail.com>
Subject: kconfig/menu.c: Fixup to "kconfig: fix undesirable side effect of
 adding "visible" menu attribute" ?
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Jan Beulich <JBeulich@novell.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

The Freetz router project has 370 [1] as a revert-patch of [2] to its
kconfig-v3.8.

commit 7ad1227818f09242cfe9bf1845fd24211f5f99bd
"kconfig: fix undesirable side effect of adding "visible" menu attribute"

I am not a kconfig-expert, but [3] looks like a fixup/folowup to it.

commit/?id=e983b7b17ad1a978e954e6aaa62cf12bfc747883
"kconfig/menu.c: fix multiple references to expressions in menu_add_prop()"

I contacted Yann in private, but I think this is worth to ask on the
linux-kbuild ML.

Thanks in advance for your help.

Regards,
- Sedat -

[1] http://freetz.org/browser/trunk/tools/make/patches/370-save-hidden-prompts-to-file.kconfig.patch
[2] kconfig: fix undesirable side effect of adding "visible" menu attribute
[3] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
