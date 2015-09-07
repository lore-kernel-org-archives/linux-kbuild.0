Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47256 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751479AbbIGG40 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Sep 2015 02:56:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NUA00AMVOLZID80@mailout1.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Mon, 07 Sep 2015 07:56:23 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <01e001d0e716$34a48b80$9deda280$@samsung.com>
 <CAK7LNAS3UFq17rHobEUpS=fbyefscPunyHu9DMTAJESzcSfLxw@mail.gmail.com>
In-reply-to: <CAK7LNAS3UFq17rHobEUpS=fbyefscPunyHu9DMTAJESzcSfLxw@mail.gmail.com>
Subject: RE: PING: [PATCH] make build tool dependencies portable
Date: Mon, 07 Sep 2015 09:56:22 +0300
Message-id: <014501d0e93a$4ee5ea90$ecb1bfb0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>
Cc: 'Linux Kbuild mailing list' <linux-kbuild@vger.kernel.org>, 'Michal Marek' <mmarek@suse.com>

 Hello!

> scripts/Makefile has the following:
> 
> hostprogs-$(CONFIG_LOGO)         += pnmtologo
> 
> 
> This should work if you enable CONFIG_LOGO in Kconfig.

 Yes, i know this. But, pnmlogo, in its turn, depends on pnmlogo.c. This is currently implicit (i don't see explicit lines anywhere), and this appears not to work correctly everywhere.

> Please do not screw up Kbuild for Cygwin.
> 
> See the answer from Michal (and you agreed)
> https://patchwork.kernel.org/patch/7014361/

 Yes, i remember. And my fix doesn't contain any it's etc, it's simple and actually it's generic. Ok, how can improve it further? What about adding explicit dependencies to scripts/Makefile then? These explicit dependencies not only fix Cygwin-related problem, but also make the Makefile more readable, don't they?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


