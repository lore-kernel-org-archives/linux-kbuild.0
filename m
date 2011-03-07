Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50699 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756512Ab1CGXgp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Mar 2011 18:36:45 -0500
Received: by bwz15 with SMTP id 15so4178152bwz.19
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Mar 2011 15:36:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <86ipw1x452.fsf@peer.zerties.org>
References: <AANLkTinBrt-fr_e61thAqLO-MN90BA6a28Lain8u__sR@mail.gmail.com>
	<86ipw1x452.fsf@peer.zerties.org>
Date: Tue, 8 Mar 2011 00:36:43 +0100
Message-ID: <AANLkTik843JCzkpa4KhPkAszpjSyyv0NPVc-LhN0-sDD@mail.gmail.com>
Subject: Re: Minimal kernel config generator based on Kconfig language
From: Filip Honckiewicz <f.honckiewicz@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christian Dietrich <stettberger@dokucode.de>
Cc: linux-kbuild@vger.kernel.org, vamos-dev@lists.informatik.uni-erlangen.de

Hello,

I had no internet for few days and couldn't check the links you sent
(now I'll do it as soon as possible), but I would like to thank you
Christian for response and tips about upper bound, lower bound and how
to understand dependencies and selects. There are many other
attributes which I'm not sure of semantics, but I try to understand it
testing make menuconfig and watching differences in generated .config
or checking mconf code. I am very appreciate for your help.

It would be nice to have semantics explained in documentation btw

Filip
