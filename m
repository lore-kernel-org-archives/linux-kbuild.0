Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19854 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754981AbbHYHrG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Aug 2015 03:47:06 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTM00H9IOAGTM30@mailout3.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Tue, 25 Aug 2015 08:47:04 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com>
 <CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
In-reply-to: <CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
Subject: RE: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
Date: Tue, 25 Aug 2015 10:47:03 +0300
Message-id: <00dc01d0df0a$3bda3e90$b38ebbb0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>, 'Michal Marek' <mmarek@suse.com>
Cc: 'Linux Kbuild mailing list' <linux-kbuild@vger.kernel.org>

 Hello!

> I am not happy with getting weird code to work around issues on
> non-Linux systems.

 What is your criteria of being weird? Why are four #undef's weird ?
 Do you want to tell that "all OSes except Linux are weird?" Isn't it too childish?
 I can say that i use Windows as my desktop OS because only Windows has all the necessary corporate software, and using Linux inside a virtual machine just for running builds is inconvenient. And vast majority of corporate users use Windows.
 Well, it's just my opinion, i'm not going to start another "Lin vs Win" war, i think it's just stupid.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


