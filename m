Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18538 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752443AbbHYJ1r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Aug 2015 05:27:47 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTM008HCSY9TX60@mailout1.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Tue, 25 Aug 2015 10:27:45 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com>
 <CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
 <00dc01d0df0a$3bda3e90$b38ebbb0$@samsung.com>
 <CAK7LNAQ31nrSZ9vjVGa3p_rr85E0V6xZSaA3xKt3JxYAMMtnLg@mail.gmail.com>
In-reply-to: <CAK7LNAQ31nrSZ9vjVGa3p_rr85E0V6xZSaA3xKt3JxYAMMtnLg@mail.gmail.com>
Subject: RE: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
Date: Tue, 25 Aug 2015 12:27:43 +0300
Message-id: <00f301d0df18$4c1702d0$e4450870$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 8BIT
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>
Cc: 'Michal Marek' <mmarek@suse.com>, 'Linux Kbuild mailing list' <linux-kbuild@vger.kernel.org>

 Hello!

> I am not criticizing your particular patch.

 Ok :)

> Once we decide to support building on other OSes,
> I fear more and more patches would come in
> to fix building issues.

 Well, we could agree on some policy like "patches should be small and elegant", and there should be no things like #if defined(__freebsd__) ... #elif defined(__CYGWIN__)... etc

 I am skipping the rest because it's already "strawberry vs eggs".

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


