Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36221 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753132AbbIIIeR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Sep 2015 04:34:17 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NUE006MNIH27J80@mailout2.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Wed, 09 Sep 2015 09:34:14 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <01e001d0e716$34a48b80$9deda280$@samsung.com>
 <CAK7LNAS3UFq17rHobEUpS=fbyefscPunyHu9DMTAJESzcSfLxw@mail.gmail.com>
 <014501d0e93a$4ee5ea90$ecb1bfb0$@samsung.com>
 <CAK7LNAQHHKUO=EWQrgHLLu0rZM5sfH=xZ+XW9t9-ehBNmf7qxQ@mail.gmail.com>
In-reply-to: <CAK7LNAQHHKUO=EWQrgHLLu0rZM5sfH=xZ+XW9t9-ehBNmf7qxQ@mail.gmail.com>
Subject: RE: PING: [PATCH] make build tool dependencies portable
Date: Wed, 09 Sep 2015 11:34:13 +0300
Message-id: <017b01d0eada$4f0f0960$ed2d1c20$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>
Cc: 'Linux Kbuild mailing list' <linux-kbuild@vger.kernel.org>, 'Michal Marek' <mmarek@suse.com>

 Hello!

> You are adding the dependency of pnmtolog and asn1_compiler.
> 
> 
> We have more host tools.  See scripts/Makefile

 Looks like the problem only happens when we have an explicit dependency of something on this binary. This appears to be the case only for these two tools.
 Ok, i see your point and i agree that this might be an ad-hoc fix. We can consider it to be GNU make's bug. Let's try that side then. :)

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


